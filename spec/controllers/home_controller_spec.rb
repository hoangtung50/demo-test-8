require 'rails_helper'

RSpec.describe HomeController, type: :controller do

  describe "GET #index" do
  	def do_request
      get :index
    end

    it "returns http success" do
      do_request
      expect(response).to have_http_status(:success)
    end
  end
end
