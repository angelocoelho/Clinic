require 'rails_helper'

RSpec.describe "specialties/show", type: :view do
  before(:each) do
    assign(:specialty, Specialty.create!(
      name: "Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
  end
end
