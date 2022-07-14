class CreateMenuTags < ActiveRecord::Migration[6.1]
  def change
    create_table :menu_tags do |t|
      t.references :menu, null: false, foreign_key: true
      t.references :tag, null: false, foreign_key: true

      t.timestamps
    end
  end
end
