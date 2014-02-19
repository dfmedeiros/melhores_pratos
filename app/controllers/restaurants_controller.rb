class RestaurantsController < ApplicationController

  def show
    @restaurant = Restaurant.find(params[:id]).decorate
  end

end
