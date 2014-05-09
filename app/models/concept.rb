class Concept < ActiveRecord::Base
  has_many :users, :through => :user_concepts
  has_many :user_concepts
end
