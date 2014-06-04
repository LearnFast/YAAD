class AddPreviousRefToAttempts < ActiveRecord::Migration
  def change
    add_reference :attempts, :previous, index: true
  end
end
