class AddVideoUrlToMemes < ActiveRecord::Migration[7.1]
  def change
    add_column :memes, :video_url, :string
  end
end
