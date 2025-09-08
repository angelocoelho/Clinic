# frozen_string_literal: true

class Room < ApplicationRecord
  has_many :appointments, dependent: :restrict_with_error

  validates :name, presence: true, uniqueness: true
end
