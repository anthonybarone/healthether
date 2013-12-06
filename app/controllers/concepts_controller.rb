class ConceptsController < ApplicationController
  
  before_action :authorize, only: [:edit, :update]
  
  def index
        @concepts = Concept.all
  end
  
  def new
        @concepts = Concept.all
        @concept = Concept.new
  end
  
  def create
    @concept = Concept.new(concept_params)
    if @concept.save
      redirect_to @concept, notice: "Concept successfully created!"
    else
      render :new
    end
  end
  
  def show
        @concept = Concept.find(params[:id])
  end
  
  def edit
        @concept = Concept.find(params[:id])
  end
  
  def update
    @concept = Concept.find(params[:id])
    if @concept.update(concept_params)
      redirect_to @concept, notice: "Concept successfully updated!"
    else
      render :edit
    end
  end
  
  def destroy
    @concept = Concept.find(params[:id])
    @concept.destroy
    redirect_to concepts_url, alert: "Concept successfully deleted!"
  end

    private

    def concept_params
      params.require(:concept).permit(:name, :image, :video, :content_area_1)
    end

end