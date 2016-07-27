# == Schema Information
#
# Table name: products
#
#  id                   :integer          not null, primary key
#  name                 :string
#  sku                  :string
#  price                :string
#  brand_id             :integer
#  picture_file_name    :string
#  picture_content_type :string
#  picture_file_size    :integer
#  picture_updated_at   :datetime
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#

FactoryGirl.define do
  factory :product do
    sequence(:name) { |n| "Product-#{n}"}
    sequence(:sku) { |n| "00-#{n}"}
    sequence(:price) { |n| n}
    brand
  end
end
