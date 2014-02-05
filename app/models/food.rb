class Food < ActiveRecord::Base

  mount_uploader :photo, FoodPhotoUploader

  belongs_to :menu_category, counter_cache: true
  has_and_belongs_to_many :cuisines

  attr_reader :cuisine_tokens

  def cuisine_tokens=(tokens)
    self.cuisine_ids = Cuisine.ids_from_tokens(tokens)
  end

end
