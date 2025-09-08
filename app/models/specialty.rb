# frozen_string_literal: true

class Specialty < ApplicationRecord
  has_many :service_types, dependent: :restrict_with_error
  has_many :professional_specialties, dependent: :delete_all
  has_many :professionals, through: :professional_specialties

  validates :name, presence: true, uniqueness: true

  def self.ransackable_attributes(_auth_object = nil)
    %w[id name created_at updated_at]
  end
end
