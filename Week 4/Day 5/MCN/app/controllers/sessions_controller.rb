class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to '/home'
    else
      redirect_to '/login'
    end
  end

  def destroy
    session.clear
    redirect_to '/home'
  end
end
