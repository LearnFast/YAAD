# == Schema Information
#
# Table name: concepts
#
#  id       :integer          not null, primary key
#  question :string(255)
#  answer   :string(255)
#

class Concept < ActiveRecord::Base
  has_many :users, :through => :user_concepts
  has_many :user_concepts, dependent: :destroy
end
