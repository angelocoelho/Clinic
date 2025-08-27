# frozen_string_literal: true

class Specialty < ApplicationRecord
  has_many :service_types, dependent: :restrict_with_error

  validates :name, presence: true, uniqueness: true

  def self.ransackable_attributes(_auth_object = nil)
    %w[id name created_at updated_at]
  end
end
