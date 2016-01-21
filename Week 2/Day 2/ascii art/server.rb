require 'sinatra'
require 'sinatra/reloader'
require 'artii'

get '/ascii/:word/?:p1?' do
  parameter = params[:p1]
  a = Artii::Base.new(font: parameter='3x5')
  @word = params[:word]
  @word = a.asciify(@word)
  erb(:ascii)
end

get '/ascii/monkey/special/secret' do
  redirect '/selfie_monkey.jpeg'
end