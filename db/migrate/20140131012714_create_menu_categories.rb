class CreateMenuCategories < ActiveRecord::Migration
  def change
    create_table :menu_categories do |t|
      t.string :name, null: false, default: ""
      t.text :description
      t.integer :foods_count, default: 0
      t.references :restaurant

      t.timestamps
    end

    add_index :menu_categories, :restaurant_id
  end
end
