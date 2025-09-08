# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Room, type: :model do
  subject(:room) { described_class.new(name:, location:) }

  let(:name)     { 'Sala 101' }
  let(:location) { 'Bloco A' }

  it 'is valid with a unique name' do
    expect(room).to be_valid
  end

  context 'when name is blank' do
    let(:name) { '' }
    it 'is not valid' do
      expect(room).not_to be_valid
      room.validate
      expect(room.errors[:name]).to be_present
    end
  end

  context 'when name already exists' do
    before { described_class.create!(name:, location: 'Outro lugar') }
    it 'is not valid (uniqueness)' do
      expect(room).not_to be_valid
      room.validate
      expect(room.errors[:name]).to be_present
    end
  end
end
