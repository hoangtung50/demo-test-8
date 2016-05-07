class ProductFilter
	include ActiveModel::Conversion
  extend  ActiveModel::Naming
	attr_accessor :brand_ids, :max_price, :min_price

  def initialize(option)
    return if option.nil?
    @brand_ids = option[:brand_ids]
    @max_price = option[:max_price]
    @min_price = option[:min_price]
  end

  def filter
    products = Product.all

    products = products.find_by_brand_ids(brand_ids) if brand_ids.present?
    products = products.find_by_max_price(max_price) if max_price.present?
    products = products.find_by_min_price(min_price) if min_price.present?
    
    products 
  end

  def persisted?
    false
  end
end