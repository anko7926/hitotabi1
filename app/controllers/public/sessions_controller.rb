# frozen_string_literal: true

class Public::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]
  before_action :validate_user, only: :create, unless: proc { params[:user][:email] == "" || params[:user][:password] == ""}

  
  def guest_sign_in
    user = User.guest
    sign_in user
    redirect_to reviews_path, notice: 'ゲストユーザーとしてログインしました。'
  end

  def validate_user
    user = User.find_by(email: params[:user][:email])
    if user.members_status?
      redirect_to new_user_registration_path
    end
  end
  
  # def exception
  #   # byebug
  #   params[:user][:email] == " " || params[:user][:password] == " "
  # end
  
  # unless params[:user][:email] == " " || params[:user][:password] == " "


    #logger.debug '============================================'
    #logger.debug user
    #logger.debug 'ここを通っています'
    #logger.debug user.inspect
    #logger.debug '============================================'
  #end
 

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
