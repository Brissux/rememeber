class Tag < ApplicationRecord
  has_many :memes, through: :meme_tags
  has_many :meme_tags

  validates :name, presence: true

  def self.find_or_create_by_name(name)
    tag = Tag.find_or_initialize_by(name: name)
    tag.save unless tag.persisted?
    tag
  end

end
