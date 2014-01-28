class AddressesController < ApplicationController

  def index
    render json: AddressSearcher.new(params[:zipcode]).search
  end

end
