# frozen_string_literal: true

class ServiceType < ApplicationRecord
  belongs_to :specialty

  validates :name, presence: true, uniqueness: { scope: :specialty_id }
  validates :duration_minutes, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validates :price_cents, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
end
