require 'yaml/store'
require './task'
require './storage'

class TodoList
  attr_reader :tasks
  def initialize(user)
    @tasks = []
    @user = user
  end

  def add_task(task)
    @tasks << task
  end

  def delete_task(id)
    deleted_task = nil
    @tasks.delete_if do |task|
      deleted_task = task if task.id == id
    end
    deleted_task
  end

  def find_task_by_id(id)
    task = @tasks.find do |task|
      task.id == id
    end
    task
  end

  def sort_by_created(order='ASC')
    @tasks.sort_by(&:created_at).reverse! if order == 'DESC'
    @tasks.sort_by(&:created_at)
  end
end

todo_list = TodoList.new("Josh")
todo_list.add_task(Task.new("Walk the dog"))
todo_list.add_task(Task.new("Buy the milk"))
todo_list.add_task(Task.new("Make my todo list into a web app"))
todo_list.save

todo_list = TodoList.new("Josh")
todo_list.load_tasks
puts todo_list.tasks.length
