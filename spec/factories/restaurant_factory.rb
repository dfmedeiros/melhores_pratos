FactoryGirl.define do
  factory :restaurant do
    name { generate :name }
    slug { generate :slug }
    zip_code { "58000000" }
    street { "Street Name" }
    street_number { 123456 }
    neighborhood { "Neighborhood" }
    city { association :city }
    user { association :user }
  end
end