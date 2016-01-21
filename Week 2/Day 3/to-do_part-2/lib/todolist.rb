require 'yaml/store'

class TodoList
  attr_reader :tasks
  def initialize(user, file)
    @user = user
    @tasks = []
    @store = Storage.new(@user, @tasks, file)
  end

  def add_task(task)
    @tasks << task
  end

  def delete_task(id)
    @tasks.delete_if { |task| task.id == id }
  end

  def find_task_by_id(id)
    @tasks.find {|task| task.id == id}
  end

  def sort_by_created(order='ASC')
    @tasks.sort_by(&:created_at).reverse! if order == 'DESC'
    @tasks.sort_by(&:created_at)
  end

  def save_tasks
    @store.save
  end

  def load_tasks
    @users, @tasks = @store.load
  end
end

# todo_list = TodoList.new("Josh")
# todo_list.add_task(Task.new("Walk the dog"))
# todo_list.add_task(Task.new("Buy the milk"))
# todo_list.add_task(Task.new("Make my todo list into a web app"))
# todo_list.save_tasks

# todo_list = TodoList.new("Josh")
# todo_list.load_tasks
# puts todo_list.tasks.length
