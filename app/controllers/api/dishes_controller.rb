class Api::DishesController < ApplicationController

  def index
    @dishes = Dish.offset(params[:offset]).limit(4)
    #instead of Dish.all to limit API access

    render json: @dishes, methods: [:counter], status: 200
  end

  def show
    @dish = Dish.find(params[:id])
    render json: @dish, status: 200
  end

  def create
    @dish = Dish.new
    @dish.name = params[:dish][:name]
    @dish.image_url = params[:dish][:image_url]
    @dish.save
  end

end
