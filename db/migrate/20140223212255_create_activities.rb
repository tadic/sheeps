class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.string :type
      t.integer :color
      t.integer :date
      t.integer :time
      t.float :total_costs
      t.string :comment

      t.timestamps
    end
  end
end
