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
    image = MiniMagick::Image.read(self.file.download)

    image_width = image.width
    base_width = 500
    base_font_size = 35 # Augmenté de 20 à 30 pour une police de base plus grande
    default_font_size = (image_width.to_f / base_width) * base_font_size
    default_font_size = [default_font_size, 35].max # Augmenté le minimum à 30

    text_height = default_font_size * 1.2
    background_height = text_height + 20

    escaped_text = text.gsub("'", "\\\\'").gsub('"', '\\"')

    image.combine_options do |c|
      c.gravity 'North'
      c.fill 'white'
      c.draw "rectangle 0,0 #{image.width},#{background_height}"
      c.fill 'black'
      c.pointsize default_font_size
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
    self.meme_tags.destroy_all
  end
end
