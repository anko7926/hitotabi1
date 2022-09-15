class Public::HomesController < ApplicationController
  before_action :authenticate_user!

  def top
    @reviews = Review.all.order("created_at DESC").first(4)
  end

  def new_guest
    user = User.find_or_create_by!(email: 'guest@example.com') do |user|
      user.password = SecureRandom.urlsafe_base64
      # user.confirmed_at = Time.now  # Confirmable を使用している場合は必要
    end
    sign_in user
    redirect_to public_reviews_path, notice: 'ゲストユーザーとしてログインしました。'
  end
end
