class FavoritesController < ApplicationController
  before_action :authenticate_user!

  def index
    if params[:search].present?
      @favorites = current_user.favorites.joins(:meme).merge(Meme.search_by_title_and_tag(params[:search])).order('favorites.created_at DESC')
    else
      @favorites = current_user.favorites.includes(:meme).order('favorites.created_at DESC')
    end
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
