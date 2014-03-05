class CreateVacinations < ActiveRecord::Migration
  def change
    create_table :vacinations do |t|
      t.string :reason
      t.string :vaccin_name
      t.integer :activity_id
      t.integer :sheep_id
      t.string :comment

      t.timestamps
    end
  end
end
