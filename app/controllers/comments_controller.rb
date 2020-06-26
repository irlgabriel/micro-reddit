class CommentController < ApplicationController
  
  def new
    @comment = Comment.new
  end

  private

  def comment_params
    params.require(:comment).permit(:body,:title)
  end
end
