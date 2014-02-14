class Panel::MenuCategoriesController < ApplicationController

  before_filter :authenticate_user!
  before_filter :load_restaurant
  before_filter :load_food, only: [:show, :create]
  before_filter :load_category, except: [:create]

  def show
    @new_category = MenuCategory.new
  end

  def create
    @menu_category = @restaurant.menu_categories.new(menu_category_params)
    @menu_category.save
  end

  def edit
  end

  def update
    @menu_category.update_attributes(menu_category_params)
  end

  def destroy
    @menu_category.destroy

    redirect_to panel_restaurant_foods_path(@restaurant), notice: I18n.t("panel.menu_categories.destroy")
  end

  private

  def load_restaurant
    @restaurant = current_user.restaurants.find(params[:restaurant_id])
  end

  def load_category
    @menu_category = @restaurant.menu_categories.find(params[:id])
  end

  def load_food
    @food = Food.new
  end

  def menu_category_params
    params
      .require(:menu_category)
      .permit(:name, :description)
  end
end
