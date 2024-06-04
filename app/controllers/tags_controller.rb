class TagsController < ApplicationController

#   def json
#     q = params[:q]
#     @tags = Tag.where("name ILIKE ?", "%#{q}%").order(name: :asc).limit(10)
#     render json: @tags
#   end
end
