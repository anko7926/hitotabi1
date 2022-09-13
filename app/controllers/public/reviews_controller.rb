class Public::ReviewsController < ApplicationController
    before_action :set_q, only: [:index, :search]
    before_action :set_user, only: [:likes]

   def index
    @reviews= Review.all
    @user= current_user
   end

  def show
    @review = Review.find(params[:id])
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

    ######### ジャンルが作成されたらフォームにジャンルを選択する機能を追加する。
    @review.genre = Genre.first
    ######### タグが作成されたらフォームにタグを選択する機能を追加する。
    @review.tag = Tag.first
    if @review.save
      redirect_to public_reviews_path(@review.id)
      flash[:notice] = "投稿を完了しました"
    else
      flash[:notice] = "必要情報を入力してください"
      render :new
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