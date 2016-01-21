require 'sinatra'
require 'sinatra/reloader'

items = []

get '/:username/:order/:time' do
  @username = params[:username]
  @hello = 'Hello World!'
  @greeting = 'good morning'
  @order = params[:order]
  @time = params[:time].to_i
  erb(:author)
end


get '/' do
  @items = items
  erb :shoppinglist
end

post '/item' do
  @items = items
  @items << params[:item]
  erb :shoppinglist
end

# get '/' do
#   erb(:form)
# end
# Or this if you don't want it to be the home page
# get '/form' do
#   erb(:form)
# end

post '/username/order/time' do
  redirect "/#{params[:username]}/#{params[:order]}/#{params[:time]}"
end
