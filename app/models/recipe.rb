class Recipe < ApplicationRecord
  belongs_to :user
  has_many :amounts
  has_many :ingredients, through: :amounts

  # "recipe"=>{"user_id"=>"3", "name"=>"Sausage Gravy ", "ingredients"=>{"name"=>"sausage", "unit"=>"lb", "amounts"=>"2"}, "method"=>"ghbnttnt", "notes"=>"hjmutmnthn"}
  #


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
