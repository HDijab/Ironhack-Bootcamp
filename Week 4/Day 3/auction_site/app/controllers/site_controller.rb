class SiteController < ApplicationController
  def index
  end

  def login
  end

  def logged
    @user = User.find_by site_params
    if @user
      redirect_to action: 'show', controller: 'users', id: @user
    else
      render 'login'
    end
  end

  private
  def site_params
    params.require(:user).permit(:name, :password)
  end
end
