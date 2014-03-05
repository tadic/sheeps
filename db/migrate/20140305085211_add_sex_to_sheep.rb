class AddSexToSheep < ActiveRecord::Migration
  def change
    add_column :sheep, :sex, :text
  end
end
