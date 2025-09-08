# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Patient, type: :model do
  subject(:patient) { described_class.new(name:, email:, phone:, birthdate:, notes:) }

  let(:name) { 'Ana Souza' }
  let(:email) { 'ana@example.com' }
  let(:phone) { '11999998888' }
  let(:birthdate) { Date.new(1995, 5, 20) }
  let(:notes) { 'Observações iniciais' }

  it 'is valid with name and unique email' do
    expect(patient).to be_valid
  end

  context 'when name is blank' do
    let(:name) { '' }
    it 'is not valid' do
      expect(patient).not_to be_valid
      patient.validate
      expect(patient.errors[:name]).to be_present
    end
  end

  context 'when email is blank' do
    let(:email) { '' }
    it 'is not valid' do
      expect(patient).not_to be_valid
      patient.validate
      expect(patient.errors[:email]).to be_present
    end
  end

  context 'when email already exists' do
    before { described_class.create!(name: 'X', email:) }
    it 'is not valid (uniqueness)' do
      expect(patient).not_to be_valid
      patient.validate
      expect(patient.errors[:email]).to be_present
    end
  end
end
