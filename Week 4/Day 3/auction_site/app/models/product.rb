class Product < ActiveRecord::Base
  belongs_to :user
  validates :title, presence: true
  validates :deadline, presence: true
  validates :user, presence: true
  validates :minimum_bid, presence: true
end
