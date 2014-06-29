class HomeController < ApplicationController
  before_action :authenticate_user!

  def index
    @concepts = current_user.concepts
    @concepts_to_learn = current_user.concepts_for_review
    @forcast_hash = current_user.forcast
  end
end
