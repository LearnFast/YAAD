class ConceptsController < ApplicationController
  def new
    @concept = Concept.new
  end

  def create
    @concept = Concept.new(concept_params)
    if @concept.save
      redirect_to @concept
    else
      render 'new'
    end
  end

  def show
    @concept = Concept.find(params[:id])
  end

  def display_concepts
    @concepts_ary = Concept.last(10)
  end

  private

  def concept_params
    params.require(:concept).permit(:question, :answer)
  end
end
