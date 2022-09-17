class Admin::ReviewsController < ApplicationController

  def edit
    @review= Review.find(params[:id])
  end

  def update
     @review = Review.find(params[:id])
      if @review.update(review_params)
        redirect_to admin_users_path, notice: "更新されました。"
      else
        render "edit"
      end
  end

  def destroy
     @review = Review.find(params[:id])
      @review.destroy
      redirect_to admin_users_path
  end

   private

   def review_params
     params.require(:review).permit(:title, :travel_comment, )
   end
end
