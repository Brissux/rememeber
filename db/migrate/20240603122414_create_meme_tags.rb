class CreateMemeTags < ActiveRecord::Migration[7.1]
  def change
    create_table :meme_tags do |t|
      t.references :tag, null: false, foreign_key: true
      t.references :meme, null: false, foreign_key: true

      t.timestamps
    end
  end
end
