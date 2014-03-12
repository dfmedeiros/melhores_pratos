class SiteController < ApplicationController

  def home
    @restaurants = Restaurant.published.limit(3).decorate
  end

end