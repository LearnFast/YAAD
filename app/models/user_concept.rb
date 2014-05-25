# == Schema Information
#
# Table name: user_concepts
#
#  id          :integer          not null, primary key
#  user_id     :integer
#  concept_id  :integer
#  attempt_id  :integer
#  review_date :datetime
#

class UserConcept < ActiveRecord::Base
  belongs_to :user
  belongs_to :concept
  belongs_to :attempts
  validates_presence_of :review_date
end
