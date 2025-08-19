# frozen_string_literal: true

require "rails_helper"

RSpec.describe Specialty, type: :model do
  describe "validations" do
    it "is valid with a unique name" do
      expect(described_class.new(name: "Psicologia")).to be_valid
    end

    it "requires name" do
      s = described_class.new(name: nil)
      expect(s).not_to be_valid
      expect(s.errors[:name]).to be_present
    end

    it "validates uniqueness of name" do
      described_class.create!(name: "Psicologia")
      dup = described_class.new(name: "Psicologia")
      expect(dup).not_to be_valid
      expect(dup.errors[:name]).to be_present
    end
  end
end
