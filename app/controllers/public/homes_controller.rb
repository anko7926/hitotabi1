class Public::HomesController < ApplicationController
  def top
    @users = User.all.order("created_at DESC").first(4)
  end
end
