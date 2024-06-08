class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :favorites
  has_many :likes
  has_many :memes
  has_one_attached :photo

  has_many :likes
  has_many :liked_memes, through: :likes, source: :meme

  validates :nickname, presence: true, uniqueness: true
end
