class Task
  attr_reader :content, :id, :updated_at, :created_at
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