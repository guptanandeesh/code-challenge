class CreateLocations < ActiveRecord::Migration[6.0]
  def change
    create_table :locations do |t|
      t.float :latitude,              null: false, precision: 8, scale: 6
      t.float :longitude,             null: false, precision: 9, scale: 6
      t.references :driver,    null: false, foreign_key: true
      t.timestamps                     null: false
    end

    add_index :locations, [:latitude, :longitude]
  end
end
