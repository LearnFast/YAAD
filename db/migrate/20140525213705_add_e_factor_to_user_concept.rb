class AddEFactorToUserConcept < ActiveRecord::Migration
  def change
    add_column :user_concepts, :e_factor, :decimal, :default => 2.5
    add_column :user_concepts, :rep_interval, :integer, :default => 1
  end
end
