class AddStartTimesToMenus < ActiveRecord::Migration[6.1]
  def change
    add_column :menus, :start_time, :datetime
  end
end
