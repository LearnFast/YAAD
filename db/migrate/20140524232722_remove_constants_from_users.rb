class RemoveConstantsFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :constant_a, :decimal
    remove_column :users, :constant_b, :decimal
  end
end
