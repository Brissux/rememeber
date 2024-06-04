class MemesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @memes = Meme.where(public: true).order(created_at: :desc)
  end

  def new
    @meme = Meme.new
    @meme_tag = @meme.meme_tags.new(tag: Tag.new)
  end

  def create
    @meme = current_user.memes.build(meme_params)
    if @meme.save
      redirect_to root_path, notice: 'Mème créé avec succès !'
      current_user.favorites.create(meme: @meme)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @meme = Meme.find(params[:id])
    @tags = @meme.tags
    # @like = current_user.likes.find_by(meme: @meme)
    # @favorite = current_user.favorites.find_by(meme: @meme)
  end

  def update
    @meme = Meme.find(params[:id])
    @meme = Meme.update(meme_params)

    respond_to do |format|
      format.html { redirect_to meme_path }
      format.text { render partial: "memes/form", locals: {meme: @meme}, formats: [:html] }
    end
  end

  private

  def meme_params
    params.require(:meme).permit(:title, :public, :image, meme_tags_attributes: [tag_attributes: [:name]])
  end
end
