class CreateIngredientsMenus < ActiveRecord::Migration[5.2]
  def change
    create_table :ingredients_menus do |t|
      t.integer :menu_id
      t.integer :ingredient_id
      t.timestamps
    end
  end
end
