class AddReviewDateToUserConcept < ActiveRecord::Migration
  def change
    add_column :user_concepts, :review_date, :datetime
  end
end
