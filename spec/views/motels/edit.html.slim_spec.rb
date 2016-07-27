require 'rails_helper'

RSpec.describe "motels/edit", type: :view do
  before(:each) do
    @motel = assign(:motel, Motel.create!())
  end

  it "renders the edit motel form" do
    render

    assert_select "form[action=?][method=?]", motel_path(@motel), "post" do
    end
  end
end
