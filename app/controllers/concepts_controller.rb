class ConceptsController < ApplicationController
  def create
    @concept = Concept.create!(question: params[:question], answer: params[:answer]).tap do |c| 
      current_user.user_concepts << UserConcept.new(concept:c, review_date:Date.today)
    end
    respond_to do |format|
      format.json { render json: @concept.id }
    end
  end

  def destroy
    Concept.find(params[:id]).destroy
    respond_to do |format|
      format.json { head :ok }
    end
  end

  def update
    UserConcept.find_by(user: current_user, concept_id: params[:id]).update_from_review! params[:response_quality].to_i
    head :no_content
  end

  def feedback
    Feedback.create!(submission: params['feedback'], user: current_user)
    render nothing: true
  end
end
