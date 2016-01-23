require 'sinatra'
require './lib/imdbapi'
require './lib/randomword'
require 'tilt/erubis'
require "pry"

get '/' do
  erb :index
end

post '/quiz' do
  params[:random] and @list = ImdbApi.new(RandomWord.pick_random_word).get_list
  params[:search_term] != "" and @list = ImdbApi.new(params[:search_term]).get_list
  # puts @list.length
  # binding.pry
  erb :posters
end
