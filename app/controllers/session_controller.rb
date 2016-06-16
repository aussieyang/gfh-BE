class SessionController < ApplicationController

  def new
    #same as erb :new - happens by default
    #layout false gives no css - can explicitly call layout
    render :new # layout: false
    #convention default will search for file of save name in layouts
  end

  def create
    user = User.find_by(email: params[:email])

    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to '/'
    else
      render :new
    end

  end

end
