class Panel::FoodsController < ApplicationController

  before_filter :authenticate_user!
  before_filter :load_restaurant

  def index
  end

  private

  def load_restaurant
    @restaurant = current_user.restaurants.find(params[:restaurant_id])
  end
end
