class AddLocationToActivity < ActiveRecord::Migration
  def change
    add_column :activities, :location, :text
  end
end
