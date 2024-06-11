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
  pg_search_scope :search_by_title_and_tag, against: :title, associated_against: { tags: :name }, using: { tsearch: { prefix: true } }

  before_destroy :delete_related_meme_tags

  def add_text_to_image(text, options = {})
    # Utilisez l'URL de l'image pour ouvrir l'image avec MiniMagick
    original_image_url = file.url
    original_image = MiniMagick::Image.open(original_image_url)

    image_width = original_image.width
    base_width, base_font_size = 500, 35
    default_font_size = [((image_width.to_f / base_width) * base_font_size), 35].max
    max_line_width = image_width * 0.9
    wrapped_text = word_wrap(text, max_line_width, default_font_size)
    line_count = wrapped_text.count("\n") + 1
    text_height = default_font_size * 1.2 * line_count
    background_height = text_height + 20

    new_image = MiniMagick::Image.open(original_image_url)
    new_image.combine_options do |c|
      c.gravity 'North'
      c.extent "#{image_width}x#{original_image.height + background_height}"
      c.fill 'white'
      c.draw "rectangle 0,0 #{image_width},#{background_height}"
      c.fill 'black'
      c.pointsize default_font_size
      c.draw "text 0,10 '#{wrapped_text}'"
    end
    new_image = new_image.composite(original_image) { |c| c.gravity 'South' }

    # Remplace l'image existante par la nouvelle
    if file.attached?
      file.purge
    end
    blob = ActiveStorage::Blob.create_and_upload!(io: StringIO.new(new_image.to_blob), filename: "edited_#{file.filename}", content_type: file.content_type)
    file.attach(blob)
  end

  private

  def word_wrap(text, max_width, font_size)
    average_char_width = font_size * 0.6
    max_chars_per_line = (max_width / average_char_width).floor
    wrapped_text, current_line = "", ""
    text.split.each do |word|
      if (current_line.length + word.length) > max_chars_per_line
        wrapped_text += current_line + "\n"
        current_line = word
      else
        current_line += " " unless current_line.empty?
        current_line += word
      end
    end
    wrapped_text += current_line
    wrapped_text
  end

  def file_presence
    errors.add(:file, "can't be blank") unless file.attached?
  end

  def delete_related_meme_tags
    meme_tags.destroy_all
  end
end
