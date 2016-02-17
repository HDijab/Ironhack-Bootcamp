class SandwichMaker < ActiveRecord::Base
  belongs_to :sandwich
  belongs_to :ingredient
end
