class RemoveSexFromLambing < ActiveRecord::Migration
  def change
    remove_column :lambings, :sex, :char
  end
end
