require 'rails_helper'

RSpec.describe "areas/index", type: :view do
  before(:each) do
    assign(:areas, [
      Area.create!(),
      Area.create!()
    ])
  end

  it "renders a list of areas" do
    render
  end
end
