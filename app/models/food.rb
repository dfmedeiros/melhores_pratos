class Food < ActiveRecord::Base

  mount_uploader :photo, FoodPhotoUploader

  belongs_to :menu_category, counter_cache: true
  has_and_belongs_to_many :cuisines

end
