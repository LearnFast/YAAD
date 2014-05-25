class ConceptsController < ApplicationController
  def create
    current_user.concepts << Concept.create!(question: params[:question], answer: params[:answer])
    @concept = Concept.last
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
