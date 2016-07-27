require 'rails_helper'

RSpec.describe "areas/show", type: :view do
  before(:each) do
    @area = assign(:area, Area.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
