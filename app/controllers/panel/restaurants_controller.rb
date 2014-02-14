class Panel::RestaurantsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :load_restaurant, only: [:show, :edit, :destroy, :publish]

  def index
    @restaurants = current_user.restaurants
  end

  def show
  end

  def new
    @restaurant = current_user.restaurants.new
  end

  def create
    @restaurant = current_user.restaurants.new(restaurant_params)
    if @restaurant.save
      redirect_to panel_restaurants_path, notice: I18n.t("panel.restaurants.create")
    else
      render :new
    end
  end

  def edit
  end

  def update
    @restaurant = current_user.restaurants.find(params[:id])
    if @restaurant.update(restaurant_params)
      redirect_to panel_restaurants_path, notice: I18n.t("panel.restaurants.update")
    else
      render :edit
    end
  end

  def publish
    published_at = @restaurant.published_at ? nil : Time.current
    @restaurant.update_attributes(published_at: published_at)

    redirect_to panel_restaurants_path, notice: I18n.t("panel.restaurants.publish")
  end

  def destroy
    @restaurant.destroy
    redirect_to panel_restaurants_path, notice: I18n.t("panel.restaurants.destroy")
  end

  private

  def load_restaurant
    @restaurant = current_user.restaurants.find(params[:id])
  end

  def restaurant_params
    params
      .require(:restaurant)
      .permit(:name, :slug, :zip_code, :street, :street_number, :neighborhood, :complement, :city_id,
        :description, :phone_number, :extra_phone_number, :logo)
  end
end