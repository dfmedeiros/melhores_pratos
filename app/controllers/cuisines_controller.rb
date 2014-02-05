class CuisinesController < ApplicationController

  def index
    @cuisines = Cuisine.where("name LIKE ?", "%#{params[:q]}%")
    render json: @cuisines
  end

end
