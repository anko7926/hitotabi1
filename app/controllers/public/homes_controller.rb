class Public::HomesController < ApplicationController
  def top
    @reviews = Review.all.order("created_at DESC").first(4)
    @user = current_user
  end
end
