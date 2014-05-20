# == Schema Information
#
# Table name: attempts
#
#  id         :integer          not null, primary key
#  created_at :datetime
#  updated_at :datetime
#  answer     :string(255)
#

class Attempt < ActiveRecord::Base
  belongs_to :user_concept
end
