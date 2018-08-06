class Ingredient < ApplicationRecord
  has_many :amounts
  has_many :recipes, through: :amounts
  has_many :inventories, through: :amounts
end
