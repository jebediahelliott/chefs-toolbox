class AddInventoryAmountToIngredients < ActiveRecord::Migration[5.2]
  def change
    add_column :ingredients, :inventory_amount, :float(2)
  end
end
