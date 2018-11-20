class Recipe < ApplicationRecord
  belongs_to :user
  has_many :menus_recipes
  has_many :menus, through: :menus_recipes
  has_many :amounts
  has_many :ingredients, through: :amounts
  validates :name, presence: true
  validates :name, uniqueness: {scope: :user}
  # ignore when all three form fields are blank
  accepts_nested_attributes_for :amounts, reject_if: proc { |attributes| attributes[:ingredient_amount].blank? && attributes[:ingredient_attributes][:unit].blank? && attributes[:ingredient_attributes][:name].blank?}

  # Search for Entree Items not used in the previous 6 weeks
  def self.six_weeks
    joins(:menu).where("menus.menu_date < ? and category = ?", (Time.now - 6.weeks), "Entree")
  end

  # Search for Recipes that include a specific ingredient
  def self.search(item)
    self.all.collect do |r|
      if r.ingredients.any?{ |i| i.name == item }
        r
      end
    end.compact
  end
end
