class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def new
  end

  def create
    @user = User.new
    @user.name = params[:name]
    @user.image_url = params[:image_url]
    @user.save
    redirect_to '/'
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.name = params[:name]
    @user.image_url = params[:image_url]
    @user.save
    redirect_to '/'
  end

  def delete
    @user = User.find(params[:id])
    @user.destroy
    redirect_to '/'
  end

end
