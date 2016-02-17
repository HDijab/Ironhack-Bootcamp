class Sandwich < ActiveRecord::Base
  has_many :sandwich_makers
  has_many :ingredients, through: :sandwich_makers
end
