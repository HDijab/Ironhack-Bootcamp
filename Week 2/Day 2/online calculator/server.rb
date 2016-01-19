require 'sinatra'
require 'sinatra/reloader'
require './lib/calculator'
require './lib/save_load'

get '/' do
  erb :index
end

post '/calculation' do
  unless params[:operator] == nil
  args = {
    first_number: params[:first_number].to_f,
    second_number: params[:second_number].to_f,
    operator: params[:operator].to_sym
  }
  end
  @result = Calculator.new(args).calculate unless args == nil
  SaveLoad.new.save(params[:saved_result]) unless params[:saved_result] == nil
  @load = SaveLoad.new.load unless params[:load_result] == nil
  erb :index
end
