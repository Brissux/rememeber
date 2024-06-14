# memes_controller.rb
class MemesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @memes = Meme.where(public: true)
    @memes = @memes.search_by_title_and_tag(params[:search]) if params[:search].present?

    case params[:filter]
    when "recent"
      @memes = @memes.order(created_at: :desc)
    when "popular"
      @memes = @memes.sort_by(&:like_counter).reverse
    else
      @memes = @memes.shuffle
    end
  end

  def new
    @meme = Meme.new
    @meme_tag = @meme.meme_tags.new(tag: Tag.new)
  end

  def create
    @meme = current_user.memes.build(meme_params)
    process_meme_tags(@meme)
    if params[:meme][:file].present?
      file = params[:meme][:file]
      if file.content_type.start_with? 'video'
        upload_result = Cloudinary::Uploader.upload_large(file.tempfile, resource_type: "video", eager: [{ format: 'jpg', width: 160, crop: 'fill', gravity: 'auto' }])
        @meme.video_url, @meme.thumbnail_url = upload_result["secure_url"], upload_result["eager"].first["secure_url"]
      end
      @meme.file.attach(file)
    elsif params[:meme][:image_url].present?
      file = URI.open(params[:meme][:image_url])
      @meme.file.attach(io: file, filename: "toto.png", content_type: "image/png")
    end

    if @meme.save
      current_user.favorites.create(meme: @meme)
      respond_to do |format|
        format.html { redirect_to @meme, notice: 'Mème créé avec succès !' }
        format.text { render partial: "shared/card2", locals: { meme: @meme }, formats: [:html] }
      end
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @meme = Meme.find(params[:id])
    if !@meme.public && @meme.user != current_user
      redirect_to root_path, alert: "Vous n'avez pas l'autorisation de voir ce meme."
      return
    end
    @tags = @meme.tags
    @favorite = Favorite.new
    @like = current_user.likes.find_by(meme: @meme) if user_signed_in?
  end

  def edit
    @meme = Meme.find(params[:id])
  end

  def update
    @meme = Meme.find(params[:id])
    if @meme.update(meme_params)
      @meme.add_text_to_image(params[:meme][:text], {}) if params[:meme][:text].present?
      redirect_to @meme, notice: 'Meme updated successfully.'
    else
      render :edit
    end
  end

  def favorite_exists?
    Favorite.exists?(user: current_user, meme: @meme)
  end

  def destroy
    @meme = Meme.find(params[:id])
    if @meme.user == current_user
      @meme.destroy
      redirect_to root_path, notice: "Meme deleted successfully."
    else
      redirect_to memes_path, alert: "You are not authorized to delete this meme."
    end
  end

  def clone
    data_uri = params.dig(:meme,:file)
    if data_uri.present?
      file_path = "image.png"
      base64_data = data_uri.split(',')[1]
      binary_data = Base64.decode64(base64_data)

      File.open(file_path, 'wb') do |file|
        file.write(binary_data)
      end
      @meme = Meme.new()
      @meme_tag = @meme.meme_tags.new(tag: Tag.new)
      @image_url = Cloudinary::Uploader.upload(file_path)["secure_url"]
      render :new, status: :unprocessable_entity
    else
      redirect_to root_path
    end
  end

  private

  def meme_params
    params.require(:meme).permit(:title, :public, :image, :video, meme_tags_attributes: [:id, :meme_id, tag_attributes: [:id, :name]])
  end

  def process_meme_tags(meme)
    meme_tags = []
    meme.meme_tags.each do |meme_tag|
      tag_names = meme_tag.tag.name.downcase.split(",").map(&:strip)
      tag_names.each do |tag_name|
        tag = Tag.find_or_create_by(name: tag_name) { |t| t.name = tag_name.downcase }
        meme_tags << MemeTag.new(meme: meme, tag: tag) unless meme.tags.include?(tag)
      end
    end
    meme.meme_tags = meme_tags
  end
end
