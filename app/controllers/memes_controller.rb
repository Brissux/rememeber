class MemesController < ApplicationController
   before_action :authenticate_user!, except: %i[index show]

  def index
    @memes = Meme.all
  end

  def show
  end

end
