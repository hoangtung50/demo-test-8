require 'rails_helper'

RSpec.describe "Motels", type: :request do
  describe "GET /motels" do
    it "works! (now write some real specs)" do
      get motels_path
      expect(response).to have_http_status(200)
    end
  end
end
