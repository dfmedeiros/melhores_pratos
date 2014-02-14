class Panel::BaseController < ApplicationController

  before_filter :authenticate_user!

  def load_restaurant
    @restaurant = current_user.restaurants.find(params[:restaurant_id] || params[:id])
  end

  def food_params
    params
      .require(:food)
      .permit(:name, :description, :photo, :special, :menu_category_id, :cuisine_tokens,
        portions_attributes: [:id, :size, :price, :_destroy]
      )
  end

  def menu_category_params
    params
      .require(:menu_category)
      .permit(:name, :description)
  end

  def restaurant_params
    params
      .require(:restaurant)
      .permit(:name, :slug, :zip_code, :street, :street_number, :neighborhood, :complement, :city_id,
        :description, :phone_number, :extra_phone_number, :logo)
  end
end
