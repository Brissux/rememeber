class Meme < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  validates :title, presence: true
  validates :image, presence: true

  has_many :likes
  has_many :favorites
  has_many :meme_tags
  has_many :tags, through: :meme_tags

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
end
