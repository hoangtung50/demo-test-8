require 'rails_helper'

RSpec.describe "motels/index", type: :view do
  before(:each) do
    assign(:motels, [
      Motel.create!(),
      Motel.create!()
    ])
  end

  it "renders a list of motels" do
    render
  end
end
