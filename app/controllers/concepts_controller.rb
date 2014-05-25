class ConceptsController < ApplicationController
  def create
    @concept = Concept.create!(question: params[:question], answer: params[:answer]).tap{current_user.concepts << c}
    respond_to do |format|
      format.json { render json: @user_concept.id }
    end
  end

  def destroy
    UserConcept.find(params[:id]).destroy
    respond_to do |format|
      format.json { head :ok }
    end
  end
end
