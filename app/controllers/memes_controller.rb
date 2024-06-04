class MemesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @memes = Meme.where(public: true).order(created_at: :desc)
  end

  def new
    @meme = Meme.new
  end

  def create
    @meme = current_user.memes.build(meme_params)
    if @meme.save
      redirect_to "/index", notice: 'Mème créé avec succès !'
      current_user.favorites.create(meme: @meme) if @meme.public
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @meme = Meme.find(params[:id])
    @like = current_user.likes.find_by(meme: @meme)
    @favorite = current_user.favorites.find_by(meme: @meme)
  end

  private

  def meme_params
    params.require(:meme).permit(:title, :public, :image, tag_names: [])
  end
end
