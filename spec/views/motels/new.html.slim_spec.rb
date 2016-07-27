require 'rails_helper'

RSpec.describe "motels/new", type: :view do
  before(:each) do
    assign(:motel, Motel.new())
  end

  it "renders new motel form" do
    render

    assert_select "form[action=?][method=?]", motels_path, "post" do
    end
  end
end
