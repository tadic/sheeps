class RemoveDateFromLambing < ActiveRecord::Migration
  def change
    remove_column :lambings, :date, :integer
  end
end
