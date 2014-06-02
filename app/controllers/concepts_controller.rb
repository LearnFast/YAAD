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
    puts params[:response_quality]
    head :no_content
  end
end
