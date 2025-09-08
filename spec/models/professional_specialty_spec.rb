# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ProfessionalSpecialty, type: :model do
  let!(:specialty) { Specialty.create!(name: 'Psicologia') }
  let!(:professional) { Professional.create!(name: 'Dra. Ana', email: 'ana@example.com') }

  subject(:professional_specialties) { described_class.new(professional:, specialty:) }

  it 'is valid for a fresh pair' do
    expect(professional_specialties).to be_valid
  end

  context 'when the pair already exists' do
    before { described_class.create!(professional:, specialty:) }

    it 'is not valid (unique per professional+specialty)' do
      expect(professional_specialties).not_to be_valid
      professional_specialties.validate
      expect(professional_specialties.errors[:professional_id]).to be_present
    end
  end
end
