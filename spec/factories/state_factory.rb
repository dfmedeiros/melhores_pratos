FactoryGirl.define do
  factory :state do
    name { generate :name }
    acronym { generate :acronym }
  end
end
