class Project < ActiveRecord::Base
  def self.iron_find(id)
    where(id: id).first
  end

  def self.clean_old
    date = Time.now - 1.day
    old_projects = Project.where("created_at > ?", date)
    old_projects.destroy_all
  end

  def self.ordered_by_creation(amount=10)
    order(created_at: :desc).limit(amount)
  end
end
