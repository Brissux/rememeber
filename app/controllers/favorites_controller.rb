class FavoritesController < ApplicationController
  before_action :authenticate_user!

  def index
    if params[:filter] == "my_memes"
      @memes = current_user.memes
      @favorites = current_user.favorites.joins(:meme).where(memes: { id: @memes, public: true })
    else
      @favorites = current_user.favorites.joins(:meme).where(memes: { public: true })
    end

    if params[:search].present?
      @favorites = @favorites.joins(:meme).merge(Meme.search_by_title_and_tag(params[:search]))
    end

    @favorites = @favorites.order(created_at: :desc)
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
