class Recipe < ApplicationRecord
  belongs_to :user
  belongs_to :menu, optional: true
  has_many :amounts
  has_many :ingredients, through: :amounts
  validates :name, presence: true
  validates :name, uniqueness: {scope: :user}
  # ignore when all three form fields are blank
  accepts_nested_attributes_for :amounts, reject_if: proc { |attributes| attributes[:ingredient_amount].blank? && attributes[:ingredient_attributes][:unit].blank? && attributes[:ingredient_attributes][:name].blank?}

  # Search for Entree Items not used in the previous 6 weeks
  def self.six_weeks
    joins(:menu).where("category = ? and menus.menu_date < ?", "Entree", (Time.now - 6.weeks))
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
