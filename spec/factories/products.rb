FactoryGirl.define do
  factory :product do
    sequence(:name) { |n| "Product-#{n}"}
    sequence(:sku) { |n| "00-#{n}"}
    sequence(:price) { |n| n}
    brand
  end
end
