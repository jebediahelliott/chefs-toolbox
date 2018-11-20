class CreateMenusRecipes < ActiveRecord::Migration[5.2]
  def change
    create_table :menus_recipes do |t|
      t.integer :menu_id
      t.integer :recipe_id
      t.timestamps
    end
  end
end
