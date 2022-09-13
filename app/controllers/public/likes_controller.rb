class Public::LikesController < ApplicationController
  def create
     review = Review.find(params[:review_id])
     @like = current_user.likes.new(review_id: review.id)
     @like.save
     render 'replace_like'
  end

   def destroy
     review = Review.find(params[:review_id])
     @like = current_user.likes.find_by(review_id: review.id)
     @like.destroy
     render 'replace_like'
   end
end