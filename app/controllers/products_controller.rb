class ProductsController < ApplicationController
  def index
    @product_filter = ProductFilter.new(product_filter_params)
    @products       = @product_filter.filter
	end

  private

  def product_filter_params
    params[:product_filter]
  end
end
