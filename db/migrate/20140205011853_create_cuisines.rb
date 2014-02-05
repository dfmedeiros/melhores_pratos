class CreateCuisines < ActiveRecord::Migration
  def change
    create_table :cuisines do |t|
      t.string :name, null: false, default: ""

      t.timestamps
    end
  end
end
