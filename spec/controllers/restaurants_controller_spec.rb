require "spec_helper"

describe RestaurantsController do

  describe "GET show" do

    let(:restaurant) { create(:restaurant) }

    it "assigns @restaurant" do
      get :show, id: restaurant.id

      expect(assigns :restaurant).to eq restaurant
    end
  end
end
