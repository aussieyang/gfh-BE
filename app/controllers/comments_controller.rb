class CommentsController < ApplicationController


  def create
    @comment = Comment.new
    @comment.comment = params[:comment]
    @comment.user_id = params[:user_id]
    @comment.dish_id = params[:dish_id]
    @comment.save
    redirect_to '/dishes'
  end

  def delete
    comment = Comment.find_by(dish_id: params[:dish_id])
    comment.destroy
    redirect_to '/dishes'
  end

end
