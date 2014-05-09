class UserConcept < ActiveRecord::Base
  belongs_to :user
  belongs_to :concept
  has_many :attempts
end
