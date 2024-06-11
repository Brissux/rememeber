class LikesController < ApplicationController
  before_action :authenticate_user!

  def create
    @meme = Meme.find_by(id: params[:meme_id])
    @like = current_user.likes.build(meme: @meme)
    if @like.save
      respond_to do |format|
        format.html { redirect_to @meme, notice: 'Mème aimé avec succès !' }
        format.text { render partial: "shared/button_like", locals: {meme: @meme}, formats: [:html] }
      end
    else
      respond_to do |format|
        format.html { redirect_to @meme, alert: 'Erreur lors de l\'ajout du like.' }
        format.text { render partial: "shared/button_like", locals: {meme: @meme}, formats: [:html] }
      end
    end
  end


  def destroy
    @meme = Meme.find(params[:meme_id])
    @like = @meme.likes.find_by(user: current_user)
    if @like.destroy
      redirect_to @meme, notice: 'Mème retiré de vos likes avec succès !'
    else
      redirect_to @meme, alert: 'Erreur lors de la suppression du like.'
    end
  end
end
