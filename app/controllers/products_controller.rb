class ProductsController < ApplicationController
  def index
    @product_filter = ProductFilter.new(product_filter_params)
    @products       = @product_filter.filter.paginate(page: params[:page], per_page: 6)
	end

  private

  def product_filter_params
    params.require(:product_filter).permit(:min_price, :max_price, :order, brand_ids: [])
  end
end
