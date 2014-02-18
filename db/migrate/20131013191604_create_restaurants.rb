class CreateRestaurants < ActiveRecord::Migration
  def change
    create_table :restaurants do |t|
      t.string :name, null: false, default: ""
      t.text :description
      t.string :website
      t.string :slug, null: false, default: ""
      t.string :logo
      t.string :cover
      t.string :website
      t.string :zip_code, null: false, default: ""
      t.string :street, null: false, default: ""
      t.string :street_number, null: false, default: ""
      t.string :neighborhood, null: false, default: ""
      t.string :phone_number
      t.string :extra_phone_number
      t.string :complement
      t.float :latitute
      t.float :longitude
      t.datetime :published_at
      t.references :city, null: false
      t.references :user, null: false

      t.timestamps
    end

    add_index :restaurants, :slug, unique: true
    add_index :restaurants, :city_id
    add_index :restaurants, :user_id
  end
end
