class Public::ReviewsController < ApplicationController
    before_action :set_q, only: [:index, :search]
    before_action :set_user, only: [:likes]

   def index
    @reviews= Review.all
    @user = current_user
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

    ######### ジャンルが作成されたらフォームにジャンルを選択する機能を追加する。
    #@review.genre = Genre.first
    ######### タグが作成されたらフォームにタグを選択する機能を追加する。
    #@review.tag = Tag.first
    if @review.save
      @review.save_tags(params[:review][:tag_name])
      redirect_to public_reviews_path(@review.id)
      flash[:notice] = "投稿を完了しました"
    else
      flash[:notice] = "必要情報を入力してください"
      render :new
    end
  end

  def edit
    @review = Review.find(params[:id])
  end

   def update
     @review = Review.find(params[:id])
     if @review.update(review_params)
       @review.save_tags(params[:review][:tag_name])
       redirect_to public_review_path(@review)
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