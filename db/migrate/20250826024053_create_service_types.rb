# frozen_string_literal: true

class CreateServiceTypes < ActiveRecord::Migration[7.1]
  def change
    create_table :service_types do |t|
      t.string  :name, null: false
      t.integer :duration_minutes, null: false
      t.integer :price_cents, null: false
      t.references :specialty, null: false, foreign_key: true
      t.timestamps

      add_index :service_types, [:specialty_id, :name], unique: true
    end
  end
end
