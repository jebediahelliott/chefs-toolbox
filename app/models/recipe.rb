class Recipe < ApplicationRecord
  belongs_to :user
  has_many :amounts
  has_many :ingredients, through: :amounts
  accepts_nested_attributes_for :amounts, reject_if: proc { |attributes| attributes[:ingredient_amount].blank? && attributes[:ingredient_attributes][:unit].blank? && attributes[:ingredient_attributes][:name].blank?}
  validates :name, presence: true


  # "recipe"=>{"user_id"=>"", "name"=>"Meatloaf", "amounts_attributes"=>{"0"=>{"ingredient_amount"=>"10", "ingredient_attributes"=>{"unit"=>"lb", "name"=>"Sausage"}}, "1"=>{"ingredient_amount"=>"", "ingredient_attributes"=>{"unit"=>"", "name"=>""}}, "2"=>{"ingredient_amount"=>"", "ingredient_attributes"=>{"unit"=>"", "name"=>""}}, "3"=>{"ingredient_amount"=>"", "ingredient_attributes"=>{"unit"=>"", "name"=>""}}, "4"=>{"ingredient_amount"=>"", "ingredient_attributes"=>{"unit"=>"", "name"=>""}}}
  # def devoid(attributes)
  #   binding.pry
  #   attributes[:ingredient_amount].blank? && attributes[:ingredient_attributes][:unit].blank? && attributes[:ingredient_attributes][:name].blank?
  # end


  # def amounts_attributes=(amounts_attributes)
  #   amounts_attributes.each do |k, v|
  #     next if v[:ingredient_amount].empty? && v[:ingredient_attributes][:unit].empty? && v[:ingredient_attributes][:name].empty?
  #     if v[:ingredient_amount].empty? || v[:ingredient_attributes][:unit].empty? || v[:ingredient_attributes][:name].empty?
  #       raise "shit"
  #     else
  #       binding.pry
  #       self.amounts.build(amounts_attributes[k])
  #     end
  #   end
  # end






end
