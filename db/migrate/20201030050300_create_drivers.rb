class CreateDrivers < ActiveRecord::Migration[6.0]
  def change
    create_table :drivers do |t|
      t.citext :name,              null: false
      t.citext :email,             null: false
      t.citext :phone_number,      null: false, precision: 10
      t.citext :license_number,    null: false
      t.citext :car_number,        null: false
      t.citext :status,            null: false
      t.timestamps null: false
    end
  end
end
