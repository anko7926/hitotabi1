class Review < ApplicationRecord
  belongs_to :user
  belongs_to :genre
  belongs_to :tag
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy


  has_one_attached :image

  validates :image, presence: true
  validates :title, presence: true
  validates :travel_comment, presence: true
  validates :evaluation, presence: true

  def liked_by?(user)
    likes.where(user_id: user.id).exists?
  end
end
