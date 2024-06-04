class FavoritesController < ApplicationController
  before_action :authenticate_user!

  def index
    @favorites = Favorite.new
  end
  
end
