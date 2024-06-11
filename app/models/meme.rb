# meme.rb
class Meme < ApplicationRecord
  belongs_to :user
  has_one_attached :file
  validates :title, presence: true
  validate :file_presence

  has_many :likes, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :meme_tags, dependent: :destroy
  has_many :tags, through: :meme_tags

  has_many :likers, through: :likes, source: :user

  accepts_nested_attributes_for :meme_tags

  include PgSearch
  pg_search_scope :search_by_title_and_tag,
    against: [:title],
    associated_against: {
      tags: [:name]
    },
    using: {
      tsearch: { prefix: true }
    }

  before_destroy :delete_related_meme_tags

  def add_text_to_image(text, options = {})
    original_image = MiniMagick::Image.read(self.file.download)

    # Configuration initiale
    image_width = original_image.width
    base_width = 500
    base_font_size = 35
    default_font_size = [((image_width.to_f / base_width) * base_font_size), 35].max

    # Préparation du texte pour gérer les retours à la ligne
    max_line_width = image_width * 0.9 # 90% de la largeur de l'image
    wrapped_text = word_wrap(text, max_line_width, default_font_size)

    # Calcul de la hauteur nécessaire pour le texte
    line_count = wrapped_text.count("\n") + 1
    text_height = default_font_size * 1.2 * line_count
    background_height = text_height + 20

    # Création d'une nouvelle image avec MiniMagick
    new_image = MiniMagick::Image.open(original_image.path)
    new_image.combine_options do |c|
      c.gravity 'North'
      c.extent "#{image_width}x#{original_image.height + background_height}"
    end

    # Ajout du texte à la nouvelle image
    new_image.combine_options do |c|
      c.gravity 'North'
      c.fill 'white'
      c.draw "rectangle 0,0 #{image_width},#{background_height}"
      c.fill 'black'
      c.pointsize default_font_size
      c.draw "text 0,10 '#{wrapped_text}'"
    end

    # Collage de l'image originale sous le texte
    new_image = new_image.composite(original_image) do |c|
      c.gravity 'South'
    end

    # Sauvegarde de l'image modifiée
    blob = ActiveStorage::Blob.create_and_upload!(
      io: StringIO.new(new_image.to_blob),
      filename: "edited_#{self.file.filename}",
      content_type: self.file.content_type
    )
    self.file.attach(blob)
  end

  # Méthode pour envelopper le texte (simplifiée)
  def word_wrap(text, max_width, font_size)
    # Estimation de la largeur moyenne d'un caractère en pixels (dépend de la police utilisée)
    average_char_width = font_size * 0.6
    max_chars_per_line = (max_width / average_char_width).floor

    wrapped_text = ""
    current_line = ""

    text.split.each do |word|
      # Si l'ajout du mot actuel dépasse la largeur maximale, ajouter la ligne actuelle au texte final
      if (current_line.length + word.length) > max_chars_per_line
        wrapped_text += current_line + "\n"
        current_line = word
      else
        # Ajouter un espace avant le mot si la ligne n'est pas vide
        current_line += " " unless current_line.empty?
        current_line += word
      end
    end

    # Ajouter la dernière ligne au texte final
    wrapped_text += current_line

    wrapped_text
  end

  private

  def file_presence
    errors.add(:file, "can't be blank") unless file.attached?
  end

  def delete_related_meme_tags
    self.meme_tags.destroy_all
  end
end
