class AddMenuIdToIngredients < ActiveRecord::Migration[5.2]
  def change
    add_column :ingredients, :menu_id, :integer
  end
end
