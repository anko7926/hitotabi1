class Review < ApplicationRecord
  belongs_to :user
  belongs_to :genre
  belongs_to :tag
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  has_one_attached :image
end
