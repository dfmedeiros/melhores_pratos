class CreatePortions < ActiveRecord::Migration
  def change
    create_table :portions do |t|
      t.string :size
      t.float :price, null: false, default: 0
      t.references :food, index: true

      t.timestamps
    end
  end
end
