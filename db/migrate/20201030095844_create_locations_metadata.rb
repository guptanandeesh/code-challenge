class CreateLocationsMetadata < ActiveRecord::Migration[6.0]
  def change
    create_table :locations_metadata do |t|
      t.references :driver, null: false, foreign_key: true
      t.float :latitude,       null: false, precision: 8, scale: 6
      t.float :longitude,      null: false, precision: 9, scale: 6
      t.datetime :time,        null: false
      t.timestamps             null: false
    end
  end
end
