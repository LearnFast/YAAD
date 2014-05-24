class AddConceptRefToUserConcepts < ActiveRecord::Migration
  def change
    add_reference :user_concepts, :concept, index: true
  end
end
