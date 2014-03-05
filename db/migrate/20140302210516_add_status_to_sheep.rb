class AddStatusToSheep < ActiveRecord::Migration
  def change
    add_column :sheep, :status, :string
  end
end
