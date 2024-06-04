class Meme < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  validates :title, presence: true

  has_many :likes
  has_many :favorites
  has_many :meme_tags
  has_many :tags, through: :meme_tags

  def public_checked?
    public? ? "checked" : ""
  end

  #after_save :save_tags

  private

  #def save_tags
    #self.tags = self.tag_ids.split(',').map do |name|
      #Tag.find_or_create_by(name: name.strip.downcase)
    #end
  #end
end
