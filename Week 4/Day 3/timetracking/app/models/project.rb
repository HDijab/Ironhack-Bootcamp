class Project < ActiveRecord::Base
  has_many :entries
  validates :name, presence: true, uniqueness: true, length: {maximum: 30}, format: {without: /[^[:alnum:]|\s]/}

  def self.ordered_by_creation(amount=10)
    order(created_at: :desc).limit(amount)
  end

  def total_hours_in_month(month = Date.today.month, year = Date.today.year)
    from = DateTime.new(year, month)
    to = DateTime.new(year, month + 1)
    entries = self.entries.where(created_at: from..to)
    hours = 0
    minutes = 0
    entries.each do |entry|
      hours += entry.hours
      minutes += entry.minutes
    end
    while minutes >= 60
      hours += 1
      minutes -= 60
    end
    return hours, minutes
  end
end
