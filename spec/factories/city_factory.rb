FactoryGirl.define do
  factory :city do
    name { generate :name }
    state { association :state }
  end
end
