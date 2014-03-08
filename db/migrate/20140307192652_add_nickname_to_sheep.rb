class AddNicknameToSheep < ActiveRecord::Migration
  def change
    add_column :sheep, :nickname, :text
  end
end
