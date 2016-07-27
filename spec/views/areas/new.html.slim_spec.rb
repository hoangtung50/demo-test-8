require 'rails_helper'

RSpec.describe "areas/new", type: :view do
  before(:each) do
    assign(:area, Area.new())
  end

  it "renders new area form" do
    render

    assert_select "form[action=?][method=?]", areas_path, "post" do
    end
  end
end
