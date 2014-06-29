class HomeController < ApplicationController
  before_action :authenticate_user!

  def index
    @concepts = current_user.concepts
    @concepts_to_learn = current_user.concepts_for_review
    
    @forcast_hash = {}
    @concepts_to_learn.each do |concept|
      uc = UserConcept.find_by(user: current_user, concept: concept)
      @forcast_hash[concept.id] = { 4 => uc.update_from_review(4).rep_interval, 5 => uc.update_from_review(5).rep_interval }
    end
  end
end
