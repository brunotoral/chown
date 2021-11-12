class AddBuyerAndSellerToTransfers < ActiveRecord::Migration[6.1]
  def change
    add_reference :transfers, :buyer, foreign_key: { to_table: 'people' }, type: :uuid
    add_reference :transfers, :seller, foreign_key: { to_table: 'people' }, type: :uuid
  end
end
