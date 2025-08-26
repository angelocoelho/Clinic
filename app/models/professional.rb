class Professional < ApplicationRecord
  has_many :appointments, dependent: :nullify
  has_many :professional_specialties, dependent: :delete_all
  has_many :specialties, through: :professional_specialties

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
end
