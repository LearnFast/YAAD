class UserConceptsController < ApplicationController
  def update
    UserConcept.find_by(user: current_user, concept_id: params[:id]).update_from_review! params[:response_quality].to_i
    head :no_content
  end
end
