class Admin::UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @reviews = @user.reviews
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])

    if @user.update(user_params)
      redirect_to admin_users_path
    else
      flash[:customer_updated_error] = "会員情報が正常に保存されませんでした。"
      redirect_to edit_admin_user_path
    end
  end

  private

  def user_params
    params.require(:user).permit(:members_status)
  end
end
