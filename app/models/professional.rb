# frozen_string_literal: true

class Professional < ApplicationRecord
  has_many :appointments, dependent: :nullify
  has_many :professional_specialties, dependent: :delete_all
  has_many :specialties, through: :professional_specialties

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true

  def self.ransackable_associations(_auth_object = nil)
    %w[appointments professional_specialties specialties]
  end

  def self.ransackable_attributes(_auth_object = nil)
    %w[name email created_at id id_value professional_id specialty_id updated_at]
  end
end
