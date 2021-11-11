class CreateVehicles < ActiveRecord::Migration[6.1]
  def change
    create_table :vehicles, id: :uuid do |t|
      t.references :person, null: false, foreign_key: true, type: :uuid
      t.string :license_plate, null: false
      t.string :renavam, null: false
      t.string :crv_number, null: false
      t.date :crv_date, null: false

      t.timestamps
    end
  end
end
