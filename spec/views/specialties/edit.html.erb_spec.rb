require 'rails_helper'

RSpec.describe "specialties/edit", type: :view do
  let(:specialty) {
    Specialty.create!(
      name: "MyString"
    )
  }

  before(:each) do
    assign(:specialty, specialty)
  end

  it "renders the edit specialty form" do
    render

    assert_select "form[action=?][method=?]", specialty_path(specialty), "post" do

      assert_select "input[name=?]", "specialty[name]"
    end
  end
end
