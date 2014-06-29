require 'test_helper'

class UserTest < Minitest::Test
  def test_concept_for_review
    @u = User.create!(email: 'kodi_ho_ja@bhanchodi.net', password: 'asdfasdgasgds')

    @uc1 = UserConcept.create!(user: @u, concept: Concept.create!(answer:'a',question:'b'), review_date: Date.today)
    @uc2 = UserConcept.create!(user: @u, concept: Concept.create!(answer:'a',question:'b'), review_date: Date.today-1)
    @uc3 = UserConcept.create!(user: @u, concept: Concept.create!(answer:'a',question:'b'), review_date: Date.today+1)
    assert_equal [@uc1.concept, @uc2.concept], @u.concepts_for_review
    User.last.delete
  end

  def test_forcast
    @u = User.create!(email: 'kodi_ho_ja@bhanchodi1.net', password: 'asdfasdgasgds')

    @uc1 = UserConcept.create!(user: @u, concept: Concept.create!(answer:'a',question:'b'), review_date: Date.today)
    @uc2 = UserConcept.create!(user: @u, concept: Concept.create!(answer:'a',question:'b'), review_date: Date.today-1)
    @uc3 = UserConcept.create!(user: @u, concept: Concept.create!(answer:'a',question:'b'), review_date: Date.today+1)

    expected = { 
      @uc1.concept.id => { 4 => @uc1.update_from_review(4).rep_interval, 5 => @uc1.update_from_review(5).rep_interval },
      @uc2.concept.id => { 4 => @uc2.update_from_review(4).rep_interval, 5 => @uc2.update_from_review(5).rep_interval }
    }

    assert_equal expected, @u.forcast
  end
end
