class AddAddressIdToOrder < ActiveRecord::Migration[5.1]
  def change
    add_column :orders, :address_id, :integer
  end
end
