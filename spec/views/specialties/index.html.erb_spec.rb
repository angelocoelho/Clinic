require 'rails_helper'

RSpec.describe "specialties/index", type: :view do
  before(:each) do
    assign(:specialties, [
      Specialty.create!(
        name: "Name"
      ),
      Specialty.create!(
        name: "Name"
      )
    ])
  end

  it "renders a list of specialties" do
    render
    cell_selector = 'div>p'
    assert_select cell_selector, text: Regexp.new("Name".to_s), count: 2
  end
end
