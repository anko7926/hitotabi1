class Public::ReviewsController < ApplicationController
    before_action :set_q, only: [:index, :search]
    before_action :set_user, only: [:likes]
    protect_from_forgery

  def index
    @reviews= Review.all
  end

  def show
    @review = Review.find(params[:id])
    @review_tags = @review.tags
    @user = current_user
    @comment = Comment.new
  end

  def search
    @results = @q.result
  end

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.user = current_user
    if @review.save
      @review.save_tags(params[:review][:tag_name])
      redirect_to reviews_path(@review.id)
      flash[:notice] = "投稿を完了しました"
    else
      flash[:alert] = "必要情報を入力してください"
      render :new
    end
  end
  
   def destroy
    @review = Review.find(params[:id]) 
    @review.destroy
    redirect_to reviews_path
   end

  def edit
    @review = Review.find(params[:id])
  end

   def update
     @review = Review.find(params[:id])
     if @review.update(review_params)
       @review.save_tags(params[:review][:tag_name])
       redirect_to review_path(@review)
       flash[:notice_update] = "ジャンル情報を更新しました！"
     else
       render :edit
     end
   end

  private

  def set_q
    @q = Review.ransack(params[:q])
  end

  def review_params
    params.require(:review).permit(:image, :title, :travel_comment, :evaluation)
  end


end