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
    process_meme_tags(@meme)

    if @meme.save
      redirect_to root_path, notice: 'Mème créé avec succès !'
      current_user.favorites.create(meme: @meme)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def meme_params
    params.require(:meme).permit(:title, :public, :image, meme_tags_attributes: [tag_attributes: [:name]])
  end

  def process_meme_tags(meme)
    meme.meme_tags.each do |meme_tag|
      tag_names = meme_tag.tag.name.split(",").map(&:strip)
      tag_names.each do |tag_name|
        tag = Tag.find_or_create_by(name: tag_name)
        meme_tag.tag = tag
      end
    end
  end
end
