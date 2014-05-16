class HomeController < ApplicationController
  before_action :authenticate_user!

  def index
    @concepts = Concept.all.sample(10)
  end
end
