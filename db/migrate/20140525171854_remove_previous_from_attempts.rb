class RemovePreviousFromAttempts < ActiveRecord::Migration
  def change
    remove_column :attempts, :previous_id, :integer
  end
end
