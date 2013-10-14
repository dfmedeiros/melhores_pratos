class CreateRestaurants < ActiveRecord::Migration
  def change
    create_table :restaurants do |t|
      t.string :name, null: false, default: ""
      t.text :description
      t.string :slug, null: false, default: ""
      t.string :website
      t.string :avatar
      t.string :zip_code, null: false, default: ""
      t.string :street
      t.string :street_number
      t.string :neighborhood, null: false, default: ""
      t.string :phone_number
      t.string :extra_phone_number
      t.string :complement
      t.float :latitute
      t.float :longitude
      t.boolean :gmaps
      t.references :city, null: false
      t.references :user, null: false

      t.timestamps
    end

    add_index :restaurants, :slug, unique: true
    add_index :restaurants, :city_id
    add_index :restaurants, :user_id
  end
end
