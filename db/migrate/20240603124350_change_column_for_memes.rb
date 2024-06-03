class ChangeColumnForMemes < ActiveRecord::Migration[7.1]
  def change
    change_column_default :memes, :public, from: nil, to: false
  end
end
