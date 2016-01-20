class Storage
  def initialize(user, tasks)
    @store = YAML::Store.new("./public/tasks.yml")
    @load = YAML::load(File.open("./public/tasks.yml"))
    @user = user
    @tasks = tasks
  end

  def save
    @store.transaction do 
      @store[@user] = @tasks
    end
  end

  def load_tasks # return a hash
    @load[@user].each do |task|
      @tasks << task
    end
    @tasks
  end
end