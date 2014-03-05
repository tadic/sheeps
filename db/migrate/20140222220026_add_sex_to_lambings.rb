class AddSexToLambings < ActiveRecord::Migration
  def change
    add_column :lambings, :sex, :char
  end
end
