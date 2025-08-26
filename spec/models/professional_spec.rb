# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Professional, type: :model do
  subject(:professional) { described_class.new(name:, email:) }

  let(:name) { 'Dra. Ana' }
  let(:email) { 'ana@example.com' }

  it 'is valid with name and unique email' do
    expect(professional).to be_valid
  end

  context 'when missing name and email' do
    let(:name) { nil }
    let(:email) { nil }
    it 'is not valid and sets errors' do
      expect(professional).not_to be_valid
      professional.validate
      expect(professional.errors[:name]).to be_present
      expect(professional.errors[:email]).to be_present
    end
  end

  context 'when email already taken' do
    before { described_class.create!(name: 'Dr. churros', email:) }
    it 'is not valid (uniqueness)' do
      expect(professional).not_to be_valid
      professional.validate
      expect(professional.errors[:email]).to be_present
    end
  end
end
