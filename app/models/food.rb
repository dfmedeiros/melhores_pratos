class Food < ActiveRecord::Base

  belongs_to :menu_category, counter_cache: true

end
