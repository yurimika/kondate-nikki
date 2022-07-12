class CreateMenus < ActiveRecord::Migration[6.1]
  def change
    create_table :menus do |t|
      t.integer :user_id
      t.string :menu_name_1
      t.text :food_detail_1
      t.string :menu_name_2
      t.text :food_detail_2
      t.string :menu_name_3
      t.text :food_detail_3
      t.string :menu_name_4
      t.text :food_detail_4
      t.string :menu_name_5
      t.text :food_detail_5
      t.string :menu_name_6
      t.text :food_detail_6
      t.string :menu_name_7
      t.text :food_detail_7
      t.string :menu_name_8
      t.text :food_detail_8
      t.text :comment

      t.timestamps
    end
  end
end
