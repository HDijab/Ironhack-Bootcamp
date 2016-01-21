class Storage
  def initialize(user, tasks, file)
    @store = YAML::Store.new(file)
    @load = YAML::load(File.open(file))
    @user = user
    @tasks = tasks
  end

  def save
    @store.transaction do 
      @store[@user] = @tasks
    end
  end

  def load
    @load.each do |key, value|
      @user = key
      @tasks = value
    end
    return @user, @tasks
  end
end