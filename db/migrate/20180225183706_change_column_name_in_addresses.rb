class ChangeColumnNameInAddresses < ActiveRecord::Migration[5.1]
  def change
    rename_column :addresses, :street_address_1, :street_address
  end
end
