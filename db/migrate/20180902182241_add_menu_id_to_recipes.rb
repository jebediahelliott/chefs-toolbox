class AddMenuIdToRecipes < ActiveRecord::Migration[5.2]
  def change
    add_column :recipes, :menu_id, :integer
  end
end
