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
