class Ingredient < ApplicationRecord
  has_many :amounts
  has_many :recipes, through: :amounts
  has_many :inventories, through: :amounts

  def ingredient_amount

  end
  # def add_ingredient(hash)
  #   return if hash[:ingredient_amount].empty?
  #   ing = Ingredient.find_or_create_by(:name => hash[:name], :unit => hash[:unit])
  #   ing.amounts.create(:ingredient_amount => hash[:ingredient_amount], :recipe => self)
  # end
  #
  # def ingredients_attributes=(ingredients)
  #   ingredients.each do |ingredient|
  #     add_ingredient(ingredient)
  #   end
  # end
end
