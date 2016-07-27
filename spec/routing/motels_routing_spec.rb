require "rails_helper"

RSpec.describe MotelsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/motels").to route_to("motels#index")
    end

    it "routes to #new" do
      expect(:get => "/motels/new").to route_to("motels#new")
    end

    it "routes to #show" do
      expect(:get => "/motels/1").to route_to("motels#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/motels/1/edit").to route_to("motels#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/motels").to route_to("motels#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/motels/1").to route_to("motels#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/motels/1").to route_to("motels#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/motels/1").to route_to("motels#destroy", :id => "1")
    end

  end
end
