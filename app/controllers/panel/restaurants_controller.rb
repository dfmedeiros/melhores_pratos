class Panel::RestaurantsController < ApplicationController
  before_filter :authenticate_user!

  def index
    @restaurants = current_user.restaurants
  end

  def show
    @restaurant = current_user.restaurants.find(params[:id])
  end

  def new
    @restaurant = current_user.restaurants.new
  end

  def create
    @restaurant = current_user.restaurants.new(restaurant_params)
    binding.pry
    if @restaurant.save
      redirect_to panel_restaurants_path, notice: "Restaurante criado com sucesso."
    else
      render :new
    end
  end

  def edit
    @restaurant = current_user.restaurants.find(params[:id])
  end

  def update
  end

  def destroy
  end

  private

  def restaurant_params
    params.require(:restaurant).permit(:name, :slug, :zip_code, :street, :street_number, :neighborhood, :complement, :city_id)
  end
end