require "spec_helper"

describe RestaurantDecorator do

  subject { restaurant.decorate }

  let(:state) { build_stubbed(:state, acronym: "XX") }
  let(:city) { build_stubbed(:city, name: "Test City", state: state) }
  let(:restaurant) { build_stubbed(:restaurant, city: city) }

  describe "#formatted_address" do
    it "returns address with city and state" do
      expect(subject.formatted_address).to eq "Street Name, Neighborhood, Test City, XX"
    end
  end

  describe "#short_formatted_address" do
    it "returns address with neighborhood, city and state" do
      expect(subject.short_formatted_address).to eq "Neighborhood, Test City, XX"
    end
  end

  describe "#formatted_website" do
    let(:restaurant) { build_stubbed(:restaurant, website: "http://example.com") }

    it "returns link to website formatted" do
      expect(subject.formatted_website).to eq "<a href=\"http://example.com\"><i class=\"icon-globe\"></i>http://example.com</a>"
    end
  end

  describe "#popover_info" do
    it "returns info from restaurant" do
      expect(subject.popover_info).to include "<strong>Cidade:</strong>\nTest City - XX"
    end
  end

  describe "#popover_title" do
    it "returns name and logo from restaurant" do
      expect(subject.popover_title).to include "<img alt=\"Thumb 50 default\" class=\"avatar20 borderradius2\" src=\"/assets/fallback/thumb_50_default.png\" />"
    end
  end

end
