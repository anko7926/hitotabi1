class Public::UsersController < ApplicationController
  before_action :search

  def index
    @users= User.all
    # distinct: trueは重複したデータを除外
    @user = @q.result(distinct: true)
  end

  def search
    # params[:q]のqには検索フォームに入力した値が入る
    @q = User.ransack(params[:q])
  end

  def show
    @user = User.find(params[:id])
    @review = Review.new
  end
end
