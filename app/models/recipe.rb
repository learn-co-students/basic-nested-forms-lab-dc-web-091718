require 'pry'
class Recipe < ActiveRecord::Base
  has_many :ingredients
  accepts_nested_attributes_for :ingredients
  before_save :erase_empty_ingredients

def erase_empty_ingredients
  # binding.pry
  self.ingredients = self.ingredients.select do |ingredient|
     ingredient.name != '' || ingredient.quantity != ''
   end
end
end
