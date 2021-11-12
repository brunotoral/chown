# frozen_string_literal: true

class RemovePersonFromTransfers < ActiveRecord::Migration[6.1]
  def change
    remove_reference :transfers, :person, null: false, foreign_key: true, type: :uuid
  end
end
