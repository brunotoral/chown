class RemoveKindFromPeople < ActiveRecord::Migration[6.1]
  def change
    remove_column :people, :kind, :integer
  end
end
