module RecipesHelper
  def ingredient_errors(recipe)
    array = []
    recipe.amounts.collect{ |amount| amount.ingredient.errors.full_messages }.each do |a|
      array.concat(a)
    end
    array.uniq
  end



  # iterate over amounts
  # access the ingredient for each amount
  # check to see if that ingredient has errors

end
