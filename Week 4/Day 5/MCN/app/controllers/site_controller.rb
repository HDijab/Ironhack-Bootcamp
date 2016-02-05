class SiteController < ApplicationController
  def index
  @concerts = Concert.where("date == ?", Date.today)
  render 'no_concerts' if @concerts.empty?
  end
end
