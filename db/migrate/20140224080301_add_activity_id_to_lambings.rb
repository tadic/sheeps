class AddActivityIdToLambings < ActiveRecord::Migration
  def change
    add_column :lambings, :activity_id, :integer
  end
end
