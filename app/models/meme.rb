require 'mini_magick'

class Meme < ApplicationRecord
  belongs_to :user
  # has_one_attached :image
  # has_one_attached :video
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

  # def public_checked?
  #   public? ? "checked" : ""
  # end

  def add_text_to_image(text, options = {})
    image = MiniMagick::Image.read(self.file.download)

    # Déterminer la largeur de l'image
    image_width = image.width

    # Calculer la taille de la police en fonction de la largeur de l'image
    # Exemple : taille de base pour 500px de largeur est 20, ajuster proportionnellement
    base_width = 500
    base_font_size = 20
    default_font_size = (image_width.to_f / base_width) * base_font_size
    default_font_size = [default_font_size, 20].max # Assurer une taille min de 20

    text_height = default_font_size * 1.2
    background_height = text_height + 20

    # Échapper les caractères spéciaux dans le texte
    escaped_text = text.gsub("'", "\\\\'").gsub('"', '\\"')

    image.combine_options do |c|
      c.gravity 'North'
      c.fill 'white'
      c.draw "rectangle 0,0 #{image.width},#{background_height}"
      c.fill 'black'
      # Utiliser des guillemets doubles autour du texte échappé
      c.pointsize default_font_size # Appliquer la taille de la police calculée
      c.draw "text 0,#{10 + (text_height - default_font_size) / 2} \"#{escaped_text}\""
    end

    blob = ActiveStorage::Blob.create_and_upload!(
      io: StringIO.new(image.to_blob),
      filename: "edited_#{self.file.filename}",
      content_type: self.file.content_type
    )
    self.file.attach(blob)
  end

  private

  def file_presence
    errors.add(:file, "can't be blank") unless file.attached?
  end

  def delete_related_meme_tags
    puts "Deleting related meme tags for meme with ID #{self.id}"
    self.meme_tags.destroy_all
  end
end
