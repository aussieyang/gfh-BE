class Admin::LikesController < ApplicationController

  def index
    @likes = Like.all
  end

  def create
    @like = Like.new
    @like.user_id = current_user.id
    @like.dish_id = params[:dish_id]
    if @like.save
      render json: @like, status:201
    else
      render json: @like.errors
    end
  end

end
