class CreateUginuces < ActiveRecord::Migration
  def change
    create_table :uginuces do |t|
      t.integer :sheep_id
      t.integer :activity_id

      t.timestamps
    end
  end
end
