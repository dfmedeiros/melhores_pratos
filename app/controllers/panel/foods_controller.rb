class Panel::FoodsController < ApplicationController

  before_filter :authenticate_user!
  before_filter :load_restaurant
  before_filter :load_food, except: [:index, :create]
  before_filter :load_category, except: :destroy

  def index
    @food = Food.new
  end

  def create
    @food = @restaurant.foods.new(food_params)
    @food.save
  end

  def edit
  end

  def update
    @food.update_attributes(food_params)
  end

  def destroy
    @food.destroy

    redirect_to panel_restaurant_foods_path(@restaurant), notice: I18n.t("panel.foods.destroy")
  end

  private

  def load_restaurant
    @restaurant = current_user.restaurants.find(params[:restaurant_id])
  end

  def load_food
    @food = @restaurant.foods.find(params[:id])
  end

  def load_category
    @menu_category = MenuCategory.new
  end

  def food_params
    params
      .require(:food)
      .permit(:name, :description, :photo, :special, :menu_category_id, :cuisine_tokens,
        portions_attributes: [:id, :size, :price, :_destroy]
      )
  end
end
