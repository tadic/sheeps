class AddATypeToActivity < ActiveRecord::Migration
  def change
    add_column :activities, :a_type, :text
  end
end
