class Panel::MenuCategoriesController < ApplicationController

  before_filter :load_variables

  def create
    @menu_category = @restaurant.menu_categories.new(menu_category_params)
    if @menu_category.save
      redirect_to panel_restaurant_foods_path(@restaurant), notice: "Categoria criada com sucesso."
    else
      render "panel/foods/index"
    end
  end

  private

  def load_variables
    @restaurant = current_user.restaurants.find(params[:restaurant_id])
    @menu_categories = @restaurant.menu_categories
  end

  def menu_category_params
    params
      .require(:menu_category)
      .permit(:name, :description)
  end
end
