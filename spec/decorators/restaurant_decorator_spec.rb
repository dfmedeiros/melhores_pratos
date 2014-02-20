require "spec_helper"

describe RestaurantDecorator do

  subject { restaurant.decorate }

  describe "#formatted_address" do
    let(:state) { build_stubbed(:state, acronym: "XX") }
    let(:city) { build_stubbed(:city, name: "Test City", state: state) }
    let(:restaurant) { build_stubbed(:restaurant, city: city) }

    it "returns address with city and state" do
      expect(subject.formatted_address).to eq "Street Name, Neighborhood, Test City, XX"
    end
  end

  describe "#formatted_website" do
    let(:restaurant) { build_stubbed(:restaurant, website: "http://example.com") }

    it "returns link to website formatted" do
      expect(subject.formatted_website).to eq "<a href=\"http://example.com\"><i class=\"icon-globe\"></i>http://example.com</a>"
    end
  end

end
