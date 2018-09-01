class CreateMenus < ActiveRecord::Migration[5.2]
  def change
    create_table :menus do |t|
      t.string :name
      t.string :monday_lunch
      t.string :monday_dinner
      t.string :tuesday_lunch
      t.string :tuesday_dinner
      t.string :wednesday_lunch
      t.string :wednesday_dinner
      t.string :thursday_lunch
      t.string :thursday_dinner
      t.string :friday_lunch
      t.string :friday_dinner
      t.string :saturday_lunch
      t.string :saturday_dinner
      t.string :sunday_lunch
      t.string :sunday_dinner
      t.integer :user_id
      t.timestamps
    end
  end
end
