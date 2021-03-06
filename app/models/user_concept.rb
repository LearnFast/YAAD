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

  def update_from_review! response_quality
    update_from_review response_quality
    attempts << Attempt.new(previous_id: attempts.last) if response_quality > 3
    self.save!
  end

  def update_from_review response_quality
    if response_quality == 0
      self.attempts.destroy_all
      self.rep_interval = new_rep_interval
      self.review_date  = Date.today + rep_interval
    elsif response_quality < 4
      self.attempts.last.destroy if attempts.last.present?
      self.e_factor = new_e_factor response_quality
    else
      self.e_factor     = new_e_factor response_quality
      self.rep_interval = new_rep_interval
      self.review_date  = Date.today + rep_interval
    end
    self
  end

  private

  def new_e_factor q
    new_ef = e_factor + (0.1-(5-q)*(0.08+(5-q)*0.02))
    new_ef < 1.3 ? 1.3 : new_ef
  end

  def new_rep_interval
    return 1 if attempts.size == 0
    return 4 if attempts.size == 1
    (rep_interval * e_factor).ceil
  end
end
