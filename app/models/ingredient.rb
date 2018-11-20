class Ingredient < ApplicationRecord
  has_many :amounts
  has_many :recipes, through: :amounts
  has_many :ingredients_menus
  has_many :menus, through: :ingredients_menus

  validates :name, presence: true
  validates :unit, presence: true


end
