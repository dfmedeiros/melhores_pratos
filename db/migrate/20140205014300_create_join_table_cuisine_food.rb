class CreateJoinTableCuisineFood < ActiveRecord::Migration
  def change
    create_join_table :cuisines, :foods do |t|
      t.index [:cuisine_id, :food_id]
      t.index [:food_id, :cuisine_id]
    end
  end
end
