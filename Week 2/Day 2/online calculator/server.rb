require 'pry'
require 'sinatra'
require 'sinatra/reloader'
require './lib/logic'

get '/' do
  erb :index
end

post '/calculation' do
  args = {
    first_number: params[:first_number],
    second_number: params[:second_number],
    operator: params[:operator],
    saved_result: params[:saved_result],
    load_result: params[:load_result]
  }
  logic = Logic.new(args)
  @result = logic.action
  erb :index
end
