# == Schema Information
#
# Table name: user_concepts
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  concept_id :integer
#  attempt_id :integer
#

class UserConcept < ActiveRecord::Base
  belongs_to :user
  belongs_to :concept
  belongs_to :attempts
end
