class Recipe < ApplicationRecord
  belongs_to :user
  belongs_to :menu, required: false
  has_many :amounts
  has_many :ingredients, through: :amounts
  validates :name, presence: true
  validates :name, uniqueness: {scope: :user}
  accepts_nested_attributes_for :amounts, reject_if: proc { |attributes| attributes[:ingredient_amount].blank? && attributes[:ingredient_attributes][:unit].blank? && attributes[:ingredient_attributes][:name].blank?}

  # def amounts_attributes=(amounts_attributes)
  #   amounts_attributes.values.each do |v|
  #     next if v[:ingredient_amount].blank? && v[:ingredient_attributes][:unit].blank? && v[:ingredient_attributes][:name].blank?
  #     if v[:id]
  #       amount = Amount.find(v[:id])
  #     else
  #       amount = self.amounts.build(v)
  #     end
  #     amount.ingredient_attributes = v[:ingredient_attributes]
  #   end
  # end

  def self.six_weeks
    joins(:menu).where("menus.menu_date < ? and category = ?", (Time.now - 6.weeks), "Entree")
  end

  def self.search(item)
    self.all.collect do |r|
      if r.ingredients.any?{ |i| i.name == item }
        r
      end
    end.compact
  end
end
