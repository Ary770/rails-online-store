class CommentsController < ApplicationController

  def create
    @comment = Comment.new(comment_params)
    @comment.save
    render json: @comment, status: 201
  end

  private

  def comment_params
    params.require(:comment).permit(:text, :user_id, :item_id)
  end

end
