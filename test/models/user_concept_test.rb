require 'test_helper'

class UserConceptTest < Minitest::Test
  def test_update_from_review
    # first time should return the same review date
    uc = UserConcept.new(review_date: Date.today, e_factor: 3.0, rep_interval: 1)
    uc.update_from_review 4
    assert_equal Date.today+1, uc.review_date
    uc = UserConcept.new(review_date: Date.today, e_factor: 3.0, rep_interval: 1)
    uc.update_from_review 5
    assert_equal Date.today+1, uc.review_date

    # second time should return the same review date
    uc = UserConcept.new(review_date: Date.today, e_factor: 3.0, rep_interval: 1)
    uc.attempts << Attempt.new
    uc.update_from_review 4
    assert_equal Date.today+4, uc.review_date
    uc = UserConcept.new(review_date: Date.today, e_factor: 3.0, rep_interval: 1)
    uc.attempts << Attempt.new
    uc.update_from_review 5
    assert_equal Date.today+4, uc.review_date

    # third time things get variable
    uc = UserConcept.new(review_date: Date.today, e_factor: 3.0, rep_interval: 4)
    2.times { uc.attempts << Attempt.new }
    uc.update_from_review 4
    assert_equal Date.today+12, uc.review_date
    uc = UserConcept.new(review_date: Date.today, e_factor: 3.0, rep_interval: 4)
    2.times { uc.attempts << Attempt.new }
    uc.update_from_review 5
    assert_equal Date.today+13, uc.review_date
  end

  def test_update_from_review!
    uc = UserConcept.new(review_date: Date.today, e_factor: 3.0, rep_interval: 1)
    uc.expects(:update_from_review).with(4)
    assert_equal 0, uc.attempts.size
    uc.update_from_review! 4
    assert_equal 1, uc.attempts.size
  end
end
