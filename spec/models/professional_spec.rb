# frozen_string_literal: true

require "rails_helper"

RSpec.describe Professional, type: :model do
  it "is valid with name and unique email" do
    expect(described_class.new(name: "Dra. Ana", email: "ana@example.com")).to be_valid
  end

  it "requires name and email" do
    p = described_class.new
    expect(p).not_to be_valid
    expect(p.errors[:name]).to be_present
    expect(p.errors[:email]).to be_present
  end

  it "validates uniqueness of email" do
    described_class.create!(name: "Dr. churros", email: "churros@example.com")
    dup = described_class.new(name: "Dr. churros", email: "churros@example.com")
    expect(dup).not_to be_valid
    expect(dup.errors[:email]).to be_present
  end
end
