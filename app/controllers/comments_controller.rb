class CommentsController < ApplicationController
  
  def new
        @concepts = Concept.all
        @comment = Comment.new
  end
  
  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      redirect_to root_path, notice: "Thanks for the feedback!"
    else
      render :new
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:firstname, :lastname, :email, :note)
  end
  
end
