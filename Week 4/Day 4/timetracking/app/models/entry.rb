class Entry < ActiveRecord::Base
  belongs_to :project
  validates :hours, presence: true, numericality: true
  validates :minutes, presence: true, numericality: true
  validates :date, presence: true
  validates :project, presence: true
end
