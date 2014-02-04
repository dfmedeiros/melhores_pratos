class Food < ActiveRecord::Base

  belongs_to :menu_category, dependent: :destroy, counter_cache: true

end
