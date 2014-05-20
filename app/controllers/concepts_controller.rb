class ConceptsController < ApplicationController
  def new
    @concept = Concept.new
  end

  def create
    @concept = Concept.create!(question: params[:question], answer: params[:answer])
    respond_to do |format|
      format.json { render json: @concept.id }
    end
  end

  def show
    @concept = Concept.find(params[:id])
  end

  def display_concepts
    @concepts_ary = Concept.last(10)
  end

  def destroy
    Concept.find(params[:id]).destroy
    respond_to do |format|
      format.json { head :ok }
    end
  end

  private

  def concept_params
    params.require(:concept).permit(:question, :answer)
  end
end
