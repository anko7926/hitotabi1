class Public::LikesController < ApplicationController

  def index
    user = User.find(params[:user_id])
    @likes = user.likes
  end

  def create
     @review = Review.find(params[:review_id])
      like= current_user.likes.build(review_id: @review.id)
      like.save
  end

   def destroy
      @review = Review.find(params[:review_id])
      like = current_user.likes.find_by(review_id: @review.id)
      like.destroy
   end
end