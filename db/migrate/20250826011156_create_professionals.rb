# frozen_string_literal: true

class CreateProfessionals < ActiveRecord::Migration[7.1]
  def change
    create_table :professionals do |t|
      t.string :name, null: false
      t.string :registration_code
      t.string :email, null: false
      t.string :phone
      t.time :workday_start
      t.time :workday_end
      t.integer :appointments_count, null: false, default: 0
      t.timestamps
    end

    add_index :professionals, :email, unique: true
  end
end
