require 'rails_helper'

RSpec.describe ProductsController, type: :controller do
  describe "GET #index" do
  	let!(:brand)              { create(:brand) }
    let!(:product)             { create(:product, brand: brand) }

  	context 'without filter' do 
      def do_request
        get :index
      end

      it "returns http success" do
	      do_request
	      expect(response).to have_http_status(:success)
	    end

      it "assigns :pre_schools and renders view :index" do
        do_request
        expect(assigns(:products).size).to eq 1
        expect(assigns(:products)).to include product
      end
    end
  end
end