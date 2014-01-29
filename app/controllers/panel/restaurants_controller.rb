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
    @restaurant = current_user.restaurants.find(params[:id])
    if @restaurant.update(restaurant_params)
      redirect_to panel_restaurants_path, notice: "Restaurante atualizado com sucesso."
    else
      render :edit
    end
  end

  def destroy
    @restaurant = current_user.restaurants.find(params[:id])
    @restaurant.destroy
    redirect_to panel_restaurants_path, notice: "Restaurante removido com sucesso."
  end

  private

  def restaurant_params
    params
      .require(:restaurant)
      .permit(:name, :slug, :zip_code, :street, :street_number, :neighborhood, :complement, :city_id,
        :description, :phone_number, :extra_phone_number)
  end
end