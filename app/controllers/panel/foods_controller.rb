class Panel::FoodsController < ApplicationController

  before_filter :authenticate_user!
  before_filter :load_variables

  def index
    @foods = @restaurant.foods
    @food = Food.new
  end

  def create
    @food = @restaurant.foods.new(food_params)
    if @food.save
      redirect_to panel_restaurant_foods_path(@restaurant), notice: "Prato criado com sucesso."
    else
      render "panel/foods/index"
    end
  end

  def destroy
    @food = @restaurant.foods.find(params[:id])
    @food.destroy

    redirect_to panel_restaurant_foods_path(@restaurant), notice: "Prato removido com sucesso"
  end

  private

  def load_variables
    @restaurant = current_user.restaurants.find(params[:restaurant_id])
    @menu_categories = @restaurant.menu_categories
    @menu_category = MenuCategory.new
  end

  def food_params
    params
      .require(:food)
      .permit(:name, :description, :photo, :special, :menu_category_id)
  end
end
