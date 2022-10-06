class Public::CommentsController < ApplicationController
   def create
    review = Review.find(params[:review_id])
    @impression_comment = current_user.comments.new(review_comment_params)
    @impression_comment.review_id = review.id
    @impression_comment.save
   end

  def destroy
    @review = Review.find(params[:review_id])
    @impression_comment= Comment.find_by(id: params[:id], review_id: params[:review_id])
    @impression_comment.destroy
  end

  private

  def review_comment_params
    params.require(:comment).permit(:impression_comment)
  end
end
