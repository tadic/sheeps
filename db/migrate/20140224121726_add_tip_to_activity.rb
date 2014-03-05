class AddTipToActivity < ActiveRecord::Migration
  def change
    add_column :activities, :tip, :string
  end
end
