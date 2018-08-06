class CreateRecipes < ActiveRecord::Migration[5.2]
  def change
    create_table :recipes do |t|
      t.string :name
      t.text :notes
      t.text :method 
      t.timestamps
    end
  end
end
