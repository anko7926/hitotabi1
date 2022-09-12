class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :review

  validates :impression_comment, presence: true
end
