require 'rails_helper'

RSpec.describe "specialties/new", type: :view do
  before(:each) do
    assign(:specialty, Specialty.new(
      name: "MyString"
    ))
  end

  it "renders new specialty form" do
    render

    assert_select "form[action=?][method=?]", specialties_path, "post" do

      assert_select "input[name=?]", "specialty[name]"
    end
  end
end
