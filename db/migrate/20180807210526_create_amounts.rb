class CreateAmounts < ActiveRecord::Migration[5.2]
  def change
    create_table :amounts do |t|
      t.integer :recipe_id
      t.integer :ingredient_id
      t.string :ingredient_amount
      t.timestamps
    end
  end
end
