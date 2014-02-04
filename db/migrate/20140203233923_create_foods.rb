class CreateFoods < ActiveRecord::Migration
  def change
    create_table :foods do |t|
      t.string :name, null: false, default: ""
      t.text :description
      t.string :photo
      t.boolean :special, default: false
      t.references :menu_category

      t.timestamps
    end

    add_index :foods, :menu_category_id
  end
end
