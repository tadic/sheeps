class AddTimeFromToActivities < ActiveRecord::Migration
  def change
    add_column :activities, :time_from, :string
  end
end
