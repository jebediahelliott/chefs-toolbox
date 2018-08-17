class Recipe < ApplicationRecord
  belongs_to :user
  has_many :amounts
  has_many :ingredients, through: :amounts
  accepts_nested_attributes_for :amounts, reject_if: proc { |attributes| attributes[:ingredient_amount].blank? && attributes[:ingredient_attributes][:unit].blank? && attributes[:ingredient_attributes][:name].blank?}
  validates :name, presence: true, uniqueness: true

  def self.search(item)
    self.all.collect do |r|
      if r.ingredients.any?{ |i| i.name == item }
        r
      end
    end.compact
  end
end
