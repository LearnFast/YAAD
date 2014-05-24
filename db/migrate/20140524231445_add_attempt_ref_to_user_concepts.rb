class AddAttemptRefToUserConcepts < ActiveRecord::Migration
  def change
    add_reference :user_concepts, :attempt, index: true
  end
end
