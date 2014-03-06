class AddDescribeToSheep < ActiveRecord::Migration
  def change
    add_column :sheep, :describe, :text
  end
end
