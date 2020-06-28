class CommentController < ApplicationController
  
  def new
    @comment = Comment.new
  end

  def show
    
  end

  private

  def comment_params
    params.require(:comment).permit(:body,:title)
  end
end
