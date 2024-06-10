class Like < ApplicationRecord
  belongs_to :user
  belongs_to :meme
  validates :user_id, uniqueness: { scope: :meme_id, message: "Vous avez déjà liké ce mème." }
end
