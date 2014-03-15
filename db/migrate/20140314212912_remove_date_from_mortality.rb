class RemoveDateFromMortality < ActiveRecord::Migration
  def change
    remove_column :mortalities, :date, :integer
  end
end
