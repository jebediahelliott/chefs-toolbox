class IngredientSerializer < ActiveModel::Serializer
  attributes :id, :name, :unit, :inventory_amount
end
