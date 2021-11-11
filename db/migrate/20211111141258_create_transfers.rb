class CreateTransfers < ActiveRecord::Migration[6.1]
  def change
    create_table :transfers, id: :uuid do |t|
      t.references :vehicle, null: false, foreign_key: true, unique: true, type: :uuid
      t.references :person, null: false, foreign_key: true, type: :uuid
      t.references :user, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
