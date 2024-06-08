class UsersController < ApplicationController
  def liked_memes
    @user = current_user
    @liked_memes = @user.liked_memes
  end
end
