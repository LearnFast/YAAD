# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string(255)      default(""), not null
#  encrypted_password     :string(255)      default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  created_at             :datetime
#  updated_at             :datetime
#  name                   :string(255)
#

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :concepts, :through => :user_concepts
  has_many :user_concepts, dependent: :destroy
  has_many :feedbacks

  def concepts_for_review
    [].tap do |ary|

      user_concepts.each do |uc|
        ary << uc.concept if uc.review_date <= Date.today
      end

      #TODO Matt wants this feature. I'm temporarily disabling so it's easier to test behavior.
      #if ary.size < 10
      #  ary += (user_concepts-ary).sample(10-ary.size).map(&:concept)
      #end
    end
  end 

  def forcast(concepts = concepts_for_review)
    {}.tap do |hash|
      concepts.each do |concept|
        uc = UserConcept.find_by(user: self, concept: concept)
        hash[concept.id] = { 4 => uc.update_from_review(4).rep_interval, 5 => uc.update_from_review(5).rep_interval }
      end
    end
  end
end
