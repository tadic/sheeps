class AddTimeToToActivities < ActiveRecord::Migration
  def change
    add_column :activities, :time_to, :string
  end
end
