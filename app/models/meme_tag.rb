class MemeTag < ApplicationRecord
  belongs_to :tag
  belongs_to :meme
end
