# frozen_string_literal: true

class Patient < ApplicationRecord
  validates :name,  presence: true
  validates :email, presence: true, uniqueness: true

  def self.ransackable_attributes(_auth_object = nil)
    %w[appointments_count birthdate created_at email id id_value name notes phone updated_at]
  end
end
