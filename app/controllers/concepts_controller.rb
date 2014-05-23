class ConceptsController < ApplicationController
  def create
    concept = Concept.create!(question: params[:question], answer: params[:answer])
    @user_concept = UserConcept.create!(user: current_user, concept: concept)
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

  private

  def concept_params
    params.require(:concept).permit(:question, :answer)
  end
end
