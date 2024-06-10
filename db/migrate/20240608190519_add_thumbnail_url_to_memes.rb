class AddThumbnailUrlToMemes < ActiveRecord::Migration[7.1]
  def change
    add_column :memes, :thumbnail_url, :string
  end
end
