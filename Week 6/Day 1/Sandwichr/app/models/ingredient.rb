class Ingredient < ActiveRecord::Base
  has_many :sandwich_makers
  has_many :sandwiches, through: :sandwich_makers
end
