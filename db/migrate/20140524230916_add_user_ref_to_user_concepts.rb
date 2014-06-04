class AddUserRefToUserConcepts < ActiveRecord::Migration
  def change
    add_reference :user_concepts, :user, index: true
  end
end
