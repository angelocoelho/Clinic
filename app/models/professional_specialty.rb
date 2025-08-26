# frozen_string_literal: true

class ProfessionalSpecialty < ApplicationRecord
  belongs_to :professional
  belongs_to :specialty

  validates :professional_id, uniqueness: { scope: :specialty_id }

  def self.ransackable_attributes(_auth_object = nil)
    %w[created_at id id_value professional_id specialty_id updated_at]
  end
end
