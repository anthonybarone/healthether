class PagesController < ApplicationController
  
  def the_idea
    @concepts = Concept.all
  end
  
  def product_creator
    @concepts = Concept.all
  end
  
  def product_types
    @concepts = Concept.all
  end
  
  def product_specs
    @concepts = Concept.all
  end
  
  def key_players
    @concepts = Concept.all    
  end
  
  def contracts
    @concepts = Concept.all    
  end
  
  def payments
    @concepts = Concept.all    
  end
  
  def render_services
    @concepts = Concept.all    
  end
  
  def maintenance
    @concepts = Concept.all    
  end
  
end