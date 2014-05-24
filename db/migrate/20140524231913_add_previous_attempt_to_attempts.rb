class AddPreviousAttemptToAttempts < ActiveRecord::Migration
  def change
    add_column :attempts, :previous_id, :integer
  end
end
