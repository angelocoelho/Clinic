def change
  create_table :rooms do |t|
    t.string :name, null: false
    t.string :location
    t.timestamps

    t.index :name, unique: true
  end
end
