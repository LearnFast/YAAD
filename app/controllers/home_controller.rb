class HomeController < ApplicationController
  before_action :authenticate_user!

  def index
    @concepts = Concept.last(10)
  end
end
