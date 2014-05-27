class AddUserAndConceptIdColumnsToUserConcept < ActiveRecord::Migration
  def change
    add_column :user_concepts, :user_id, :integer
    add_column :user_concepts, :concept_id, :integer
  end
end
