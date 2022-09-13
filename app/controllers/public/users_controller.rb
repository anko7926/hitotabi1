class Public::UsersController < ApplicationController
  before_action :set_user, only: [:likes]

  def likes
    likes = Like.where(user_id: @user.id).pluck(:review_id)
    @like_reviewes = Review.find(likes)
  end

  private

  def set_user
    @user = User.find(params[:id])
  end
end
