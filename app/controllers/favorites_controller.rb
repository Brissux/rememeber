class FavoritesController < ApplicationController
  before_action :authenticate_user!

  def index
    @favorites = current_user.favorites
  end

  def create
    @meme = Meme.find(params[:meme_id])
    @favorite = Favorite.new
    @favorite.meme = @meme
    @favorite.user = current_user
    @favorite.save
    redirect_to meme_path(@meme)
  end

  def destroy
    @favorite = Favorite.find(params[:id])
    @meme = @favorite.meme
    @favorite.destroy
    redirect_to meme_path(@meme)
  end
end
