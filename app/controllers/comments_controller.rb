class CommentsController < ApplicationController
  
  def new
        @concepts = Concept.all
        @comment = Comment.new
  end
  
end
