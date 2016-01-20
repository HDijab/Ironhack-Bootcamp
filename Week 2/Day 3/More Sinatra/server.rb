require 'sinatra'

# set :port, # 3000 # if you have port issues
enable :sessions

get '/' do
  @text = session[:anything]
  erb :index
end

get '/session-data' do # wouldn't work if under get '/:text'
  @text = session[:anything]
  erb :index
end

get '/:text' do # paths with parameters should be at the bottom
  session[:anything] = params[:text]
  redirect '/'
end
