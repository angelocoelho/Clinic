# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ServiceType, type: :model do
  let!(:specialty) { Specialty.create!(name: 'Psicologia') }

  subject(:service_type) do
    described_class.new(
      name: 'Consulta Individual',
      duration_minutes: 50,
      price_cents: 15_000,
      specialty: specialty
    )
  end

  it 'is valid with required fields and positive numbers' do
    expect(service_type).to be_valid
  end

  context 'when missing name' do
    before { service_type.name = '' }
    it { is_expected.not_to be_valid }
  end

  context 'when duration_minutes <= 0' do
    before { service_type.duration_minutes = 0 }
    it { is_expected.not_to be_valid }
  end

  context 'when price_cents negative' do
    before { service_type.price_cents = -100 }
    it { is_expected.not_to be_valid }
  end

  context 'when name duplicates within same specialty' do
    before do
      described_class.create!(
        name: 'Consulta Individual',
        duration_minutes: 50,
        price_cents: 15_000,
        specialty: specialty
      )
    end

    it 'is not valid (scoped uniqueness)' do
      expect(service_type).not_to be_valid
      service_type.validate
      expect(service_type.errors[:name]).to be_present
    end
  end
end
