FactoryGirl.define do
  sequence :url do |n|
    "url#{n}.com"
  end

  sequence :name do |n|
    "The #{n}"
  end

  sequence :acronym do |n|
    "X#{n}"
  end

  sequence :slug do |n|
    "url#{n}"
  end

  sequence :content do |n|
    "nice content #{n}"
  end

  sequence :email do |n|
    "user#{n}@food.com"
  end
end