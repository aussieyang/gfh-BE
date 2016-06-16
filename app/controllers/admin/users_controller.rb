class Admin::UsersController < ApplicationController

  def index
    @users = User.all
  end

  def new
  end

  def create
    @user = User.new(user_params)
    @user.save
    redirect_to '/admin/users'
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    # @user.name = params[:name]
    # @user.email = params[:email]
    @user.update(user_params)
    @user.save
    redirect_to '/admin/users'
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to '/admin'
  end

  # filtering out columns we don't want to give access to - using whitelisting
  def user_params
    params.require(:user).permit(:email, :name)
  end

end
