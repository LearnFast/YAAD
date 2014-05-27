class HomeController < ApplicationController
  before_action :authenticate_user!

  def index
    @user_concepts = UserConcept.where(user: current_user).includes(:concept)
    @user_concepts_to_learn = @user_concepts.sample(10)
  end
end
