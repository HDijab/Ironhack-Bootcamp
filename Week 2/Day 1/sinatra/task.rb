require 'yaml/store'
class Task #:nodoc:
  attr_reader :content, :id, :updated_at, :created_at, :completed #remove after testing
  @@current_id = 1
  def initialize(content)
    @content = content
    @id = @@current_id
    @completed = false
    @created_at = Time.now
    @updated_at = nil
    @@current_id += 1
  end

  def complete?
    @completed
  end

  def complete!
    @completed = true
  end

  def make_incomplete!
    @completed = false
  end

  def update_content!(phrase)
    @content = phrase
    @updated_at = Time.now
  end
end

class TodoList
  include
  attr_reader :tasks
  def initialize(user)
    @todo_store = YAML::Store.new("./public/tasks.yml")
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
    if order == 'DESC'
      @tasks.sort_by(&:created_at).reverse!
    else
      @tasks.sort_by(&:created_at)
    end
  end

  def save
    @todo_store.transaction do 
        @todo_store[@user] = @tasks
    end
  end
  
  # Fix This Shit
  # def load_tasks
  #   tasks = YAML::load(File.open('./public/tasks.yml'))
  #   @user = tasks[@user]
  #   @tasks = tasks[@tasks]
  # end
end

todo_list = TodoList.new("Josh")
task = Task.new("Walk the dog")
task2 = Task.new("Buy the milk")
task3 = Task.new("Make my todo list into a web app")
todo_list.save

# todo_list = TodoList.new("Josh")
# todo_list.load_tasks
# puts todo_list.tasks.length
