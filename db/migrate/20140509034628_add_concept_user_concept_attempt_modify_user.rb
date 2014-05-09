class AddConceptUserConceptAttemptModifyUser < ActiveRecord::Migration
  def change
    add_column :users, :name, :string
    add_column :users, :constant_a, :decimal
    add_column :users, :constant_b, :decimal

    create_table :concepts do |t|
      t.string :question
      t.string :answer
    end

    create_table :user_concepts

    create_table :attempts do |t|
      t.timestamps
      t.string :answer
    end
  end
end
