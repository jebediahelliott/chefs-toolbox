class Amount < ApplicationRecord
  belongs_to :ingredient
  belongs_to :recipe
  validates :ingredient_amount, presence: true

  def ingredient_attributes=(ingredient_attributes)
    self.ingredient = Ingredient.find_or_initialize_by(ingredient_attributes)
  end

end
