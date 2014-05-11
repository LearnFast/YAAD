# == Schema Information
#
# Table name: user_concepts
#
#  id :integer          not null, primary key
#

class UserConcept < ActiveRecord::Base
  belongs_to :user
  belongs_to :concept
  has_many :attempts
end
