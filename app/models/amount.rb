class Amount < ApplicationRecord
  belongs_to :ingredient
  belongs_to :recipe

  def ingredient_attributes=(ingredient_attributes)
    self.ingredient = Ingredient.find_or_create_by(ingredient_attributes)
  end

end
