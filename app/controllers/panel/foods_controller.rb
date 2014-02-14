class Panel::FoodsController < Panel::BaseController

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

  def load_food
    @food = @restaurant.foods.find(params[:id])
  end

  def load_category
    @menu_category = MenuCategory.new
  end
end
