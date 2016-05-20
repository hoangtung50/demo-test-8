class ProductFilter
	include ActiveModel::Model

	attr_accessor :brand_ids, :max_price, :min_price, :order

  def initialize(option)
    return if option.nil?
    @brand_ids = option[:brand_ids].collect{|i| i.to_i}
    @max_price = option[:max_price]
    @min_price = option[:min_price]
    @order = option[:order]
  end

  def filter
    products = Product.all

    products = products.find_by_brand_ids(brand_ids) if brand_ids.present?
    products = products.find_by_max_price(max_price) if max_price.present?
    products = products.find_by_min_price(min_price) if min_price.present?
    products = order.present? ? products.order(name: order.to_sym) : products.order("name asc")
    
    products 
  end

  def persisted?
    false
  end
end