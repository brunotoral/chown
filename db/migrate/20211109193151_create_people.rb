# frozen_string_literal: true

class CreatePeople < ActiveRecord::Migration[6.1]
  def change
    create_table :people, id: :uuid do |t|
      t.string :name, null: false
      t.string :document_number, null: false
      t.integer :kind, default: 0, null: false

      t.timestamps
    end
  end
end
