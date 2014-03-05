class RemoveTimeFromActivities < ActiveRecord::Migration
  def change
    remove_column :activities, :time, :integer
  end
end
