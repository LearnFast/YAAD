# == Schema Information
#
# Table name: user_concepts
#
#  id           :integer          not null, primary key
#  user_id      :integer
#  concept_id   :integer
#  review_date  :datetime
#  e_factor     :decimal(, )      default(2.5)
#  rep_interval :integer          default(1)
#

class UserConcept < ActiveRecord::Base
  belongs_to :user
  belongs_to :concept
  has_many :attempts
  validates_presence_of :review_date

  def update_from_review response_quality
    self.e_factor     = new_e_factor response_quality
    self.rep_interval = new_rep_interval
    self.review_date  = Date.today + rep_interval
    self.save!
  end

  private

  def new_e_factor q
    new_ef = e_factor + (0.1-(5-q)*(0.08+(5-q)*0.02))
    new_ef < 1.3 ? 1.3 : new_ef
  end

  def new_rep_interval
    return 1 if attempts.size == 1
    return 6 if attempts.size == 2
    (rep_interval * e_factor).ceil
  end
end
