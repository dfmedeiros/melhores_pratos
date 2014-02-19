FactoryGirl.define do
  factory :user do
    name { generate :name }
    email { generate :email }
    password { "123456" }
    password_confirmation { "123456" }
  end
end
