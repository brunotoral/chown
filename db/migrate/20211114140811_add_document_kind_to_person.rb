class AddDocumentKindToPerson < ActiveRecord::Migration[6.1]
  def change
    add_column :people, :document_kind, :integer, default: 0
  end
end
