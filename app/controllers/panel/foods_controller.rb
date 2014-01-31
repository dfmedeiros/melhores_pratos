class Panel::FoodsController < ApplicationController

  before_filter :authenticate_user!
  before_filter :load_variables

  def index
  end

  private

  def load_variables
    @restaurant = current_user.restaurants.find(params[:restaurant_id])
    @menu_categories = @restaurant.menu_categories
    @menu_category = @restaurant.menu_categories.new
  end
end
