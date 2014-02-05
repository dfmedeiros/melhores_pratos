class CuisinesController < ApplicationController

  def index
    @cuisines = Cuisine.tokens(params[:q])
    render json: @cuisines
  end

end
