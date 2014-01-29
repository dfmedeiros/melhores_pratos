class CitiesController < ApplicationController

  def index
    @cities = City.where(state_id: params[:state_id])
    render json: @cities.to_json
  end

end
