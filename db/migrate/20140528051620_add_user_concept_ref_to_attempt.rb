class AddUserConceptRefToAttempt < ActiveRecord::Migration
  def change
    add_reference :attempts, :user_concept, index: true
    remove_reference :user_concepts, :attempt, index: true
  end
end
