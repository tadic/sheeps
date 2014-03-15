class AddActivityIdToMortality < ActiveRecord::Migration
  def change
    add_column :mortalities, :activity_id, :integer
  end
end
