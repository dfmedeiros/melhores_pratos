class Panel::FoodsController < ApplicationController

  before_filter :authenticate_user!
  before_filter :load_variables

  def index
    @food = Food.new
  end

  def create
    @food = @restaurant.foods.new(food_params)
    if @food.save
      redirect_to panel_restaurant_foods_path(@restaurant), notice: "Prato criado com sucesso."
    else
      render :index
    end
  end

  def edit
    @food = @restaurant.foods.find(params[:id])
  end

  def update
    @food = @restaurant.foods.find(params[:id])
    if @food.update_attributes(food_params)
      redirect_to panel_restaurant_foods_path(@restaurant), notice: "Prato atualizado com sucesso."
    else
      render :edit
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
    @new_category = MenuCategory.new
    @foods = @restaurant.foods
  end

  def food_params
    params
      .require(:food)
      .permit(:name, :description, :photo, :special, :menu_category_id, :cuisine_tokens,
        portions_attributes: [:id, :size, :price, :_destroy]
      )
  end
end
