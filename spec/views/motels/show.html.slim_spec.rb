require 'rails_helper'

RSpec.describe "motels/show", type: :view do
  before(:each) do
    @motel = assign(:motel, Motel.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
