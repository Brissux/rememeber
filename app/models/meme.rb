class Meme < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  has_one_attached :video
  validates :title, presence: true
  validate :file_presence

  has_many :likes
  has_many :favorites
  has_many :meme_tags
  has_many :tags, through: :meme_tags

  has_many :likes
  has_many :likers, through: :likes, source: :user

  accepts_nested_attributes_for :meme_tags

  include PgSearch
  pg_search_scope :search_by_title_and_tag,
    against: [ :title],
    associated_against: {
      tags: [:name]
    },
    using: {
      tsearch: { prefix: true }
    }

  # def public_checked?
  #   public? ? "checked" : ""
  # end

  private

  def file_presence
    if image.blank? && video.blank?
      errors.add(:base, "You must provide either an image or a video")
    end
  end
end
