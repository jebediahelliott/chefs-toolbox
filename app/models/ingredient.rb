class Ingredient < ApplicationRecord
  has_many :amounts
  has_many :recipes, through: :amounts

  validates :name, presence: true
  validates :unit, presence: true


end
