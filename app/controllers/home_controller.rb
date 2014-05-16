class HomeController < ApplicationController
  before_action :authenticate_user!

  def index
    @concepts = Concept.all
    @concepts_to_learn = @concepts.sample(10)
  end
end
