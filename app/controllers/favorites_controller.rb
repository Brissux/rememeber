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
    # redirect_to meme_path(@meme), notice: 'Favori créé avec succès !'

    respond_to do |format|
      format.html { meme_favorites_path(meme) }
      format.text { render partial: "memes/favorite", locals: { meme: @meme }, formats: [:html] }
    end
  end

  def delete
    @favorite = Favorite.find(params[:id])
    @favorite.destroy

    respond_to do |format|
      format.html { meme_favorite_path(meme, favorite) }
      format.text { render partial: "memes/favorite", locals: { meme: @meme, favorite: @favorite }, formats: [:html] }
    end
  end
end
