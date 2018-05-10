class CommentsController < ApplicationController

  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      render json: @comment, status: 201
    else
      redirect_to item_path(@comment.item_id)
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text, :user_id, :item_id)
  end

end
