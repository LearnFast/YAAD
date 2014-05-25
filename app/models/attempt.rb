# == Schema Information
#
# Table name: attempts
#
#  id          :integer          not null, primary key
#  created_at  :datetime
#  updated_at  :datetime
#  answer      :string(255)
#  previous_id :integer
#

class Attempt < ActiveRecord::Base
  has_one :user_concept
  has_one :subsequent, class_name: 'Attempt', foreign_key: 'previous_id'
  belongs_to :previous, class_name: 'Attempt'
end
