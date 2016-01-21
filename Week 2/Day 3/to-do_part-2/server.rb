require 'sinatra'
require 'sinatra/reloader'
require './lib/todolist'
require './lib/task'
require './lib/storage'
require 'pry'

todo_list = TodoList.new("Josh", "public/tasks.yml")

get '/' do
  todo_list.load_tasks
  @tasks = todo_list.tasks
  erb :index
end

get '/complete_task/:id' do
  (todo_list.find_task_by_id(params[:id].to_i)).complete!
  @tasks = todo_list.tasks
  erb :index
end

get '/delete_task/:id' do
  todo_list.delete_task(params[:id].to_i)
  todo_list.save_tasks
  redirect '/'
end

get '/new_task' do
  erb :new_task
end

post '/create_task' do
  todo_list.add_task(Task.new(params[:task]))
  todo_list.save_tasks
  redirect '/'
end
