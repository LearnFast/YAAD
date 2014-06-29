require 'test_helper'

class UserTest < Minitest::Test
  def test_concept_for_review
    u = User.create!(email: 'kodi_ho_ja@bhanchodi.net', password: 'asdfasdgasgds')

    uc1 = UserConcept.create!(user: u, concept: Concept.create!(answer:'a',question:'b'), review_date: Date.today)
    uc2 = UserConcept.create!(user: u, concept: Concept.create!(answer:'a',question:'b'), review_date: Date.today-1)
    uc3 = UserConcept.create!(user: u, concept: Concept.create!(answer:'a',question:'b'), review_date: Date.today+1)
    assert_equal [uc1.concept, uc2.concept], u.concepts_for_review
    User.last.delete
  end
end
