class Panel::RestaurantsController < Panel::BaseController

  before_filter :load_restaurant, except: [:index, :new, :create]

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
end