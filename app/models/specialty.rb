# frozen_string_literal: true

class Specialty < ApplicationRecord
  validates :name, presence: true, uniqueness: true
end
