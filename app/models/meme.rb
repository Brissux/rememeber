class Meme < ApplicationRecord
  belongs_to :user

  validates :title, presence: true

  has_many :likes
  has_many :favorites
  has_many :tags, through: :meme_tags
end
