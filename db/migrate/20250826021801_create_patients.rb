class CreatePatients < ActiveRecord::Migration[7.1]
  def change
    create_table :patients do |t|
      t.string :name
      t.string :email
      t.string :phone
      t.date :birthdate
      t.text :notes
      t.integer :appointments_count

      t.timestamps
    end
  end

  add_index :patients, :email, unique: true
end
