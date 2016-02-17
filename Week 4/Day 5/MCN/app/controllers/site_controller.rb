class SiteController < ApplicationController
  def index
  @user = current_user ? current_user.username : "Guest"
  @concerts = Concert.where("date == ?", Date.today)
  render 'no_concerts' if @concerts.empty?
  end
end
