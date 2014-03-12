require "spec_helper"

describe SiteController do

  describe "GET home" do

    let(:restaurant) { create(:restaurant, published_at: Time.current) }
    let(:restaurants) { [restaurant] }

    it "assigns @restaurants" do
      expect(Restaurant).to receive(:published).and_return restaurants
      expect(restaurants).to receive(:limit).with(3).and_return restaurants
      expect(restaurants).to receive(:decorate).and_return restaurants

      get :home

      expect(assigns :restaurants).to eq restaurants
    end
  end

end
