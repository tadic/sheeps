class AddLambToLambings < ActiveRecord::Migration
  def change
    add_column :lambings, :lamb_id, :integer
  end
end
