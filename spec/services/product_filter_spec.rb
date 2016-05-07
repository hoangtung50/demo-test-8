require 'rails_helper'

describe ProductFilter do
  describe '#filter' do
  	let!(:brand)              { create(:brand) }
    let!(:product)             { create(:product, brand: brand) }
    

    it 'returns a list of products found' do
      products = ProductFilter.new(brand_ids: [brand]).filter
      expect(products).to include product
    end
  end
end