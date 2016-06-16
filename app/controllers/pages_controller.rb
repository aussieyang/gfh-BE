class PagesController < ApplicationController

  layout 'session' #uses the layout for entire controller

  def home
    redirect_to '/login' unless logged_in?
  end

  def show_dish
    @dish = Dish.find(params[:id])
    @comment = Comment.find_by(dish_id: params[:id])
  end

end
