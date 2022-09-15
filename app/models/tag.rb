class Tag < ApplicationRecord
  has_many :reviews, dependent: :destroy

  has_many :review_tags, dependent: :destroy, foreign_key: 'tag_id'
  has_many :reviews, through: :review_tags
end
