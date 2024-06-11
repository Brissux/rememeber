class MemesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    if params[:search].present?
      @memes = Meme.search_by_title_and_tag(params[:search]).where(public: true)
    else
      @memes = Meme.where(public: true).order(created_at: :desc)
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
        @meme.video_url = upload_result["secure_url"]
        @meme.thumbnail_url = upload_result["eager"].first["secure_url"]
      end
      @meme.file.attach(file)
    end
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
    @favorite = Favorite.new
    @like = current_user.likes.find_by(meme: @meme) if user_signed_in?
  end

  # def update
  #   @meme = Meme.find(params[:id])
  #   @meme.update(meme_params)

  #   respond_to do |format|
  #     format.html { redirect_to meme_path }
  #     format.text { render partial: "memes/form", locals: { meme: @meme }, formats: [:html] }
  #   end
  # end

  def edit
    @meme = Meme.find(params[:id])
  end

  def update
    @meme = Meme.find(params[:id])
    if @meme.update(meme_params)
      # Le texte est ajouté au-dessus de l'image sans la rogner, avec une taille et une couleur de police par défaut.
      @meme.add_text_to_image(params[:meme][:text], {}) if params[:meme][:text].present?
      redirect_to @meme, notice: 'Meme updated successfully.'
    else
      render :edit
    end
  end

  def preview_text
    meme = Meme.find(params[:id])
    meme.add_text_to_image(params[:text], {color: 'black', size: 20}) # Utilisez les options souhaitées
    render json: {image_url: url_for(meme.file)}
  end

  helper_method :favorite_exists?

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

  private

  def meme_params
    params.require(:meme).permit(:title, :public, :image, :video)
  end

  def process_meme_tags(meme)
    meme_tags = []

    meme.meme_tags.each do |meme_tag|
      tag_names = meme_tag.tag.name.downcase.split(",").map(&:strip)

      tag_names.each do |tag_name|
        tag = Tag.find_or_create_by(name: tag_name) do |t|
          t.name = tag_name.downcase
        end
        meme_tags << MemeTag.new(meme: meme, tag: tag) unless meme.tags.include?(tag)
      end
    end

    meme.meme_tags = meme_tags
  end
end
