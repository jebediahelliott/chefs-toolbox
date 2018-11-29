class Ingredient < ApplicationRecord
  attribute :inventory_amount, :float, default: 0
  has_many :amounts
  has_many :recipes, through: :amounts

  validates :name, presence: true
  validates :unit, presence: true


end
