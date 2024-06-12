class Meme < ApplicationRecord
  belongs_to :user
  has_one_attached :file
  validates :title, presence: true
  validate :file_presence

  has_many :likes,  dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :meme_tags, dependent: :destroy
  has_many :tags, through: :meme_tags

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

  before_destroy :delete_related_meme_tags

  private

  def file_presence
    errors.add(:file, "can't be blank") unless file.attached?
  end

  def delete_related_meme_tags
    puts "Deleting related meme tags for meme with ID #{self.id}"
    self.meme_tags.destroy_all
  end
end
