class MemeTag < ApplicationRecord
  belongs_to :meme
  belongs_to :tag

  accepts_nested_attributes_for :tag
end
