class CreateAddresses < ActiveRecord::Migration[6.1]
  def change
    create_table :addresses, id: :uuid do |t|
      t.string :state
      t.string :city
      t.string :district
      t.string :street
      t.string :number
      t.string :complement
      t.string :zip_code
      t.references :person, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
