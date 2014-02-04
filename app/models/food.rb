class Food < ActiveRecord::Base

  mount_uploader :photo, FoodPhotoUploader

  belongs_to :menu_category, counter_cache: true

end
