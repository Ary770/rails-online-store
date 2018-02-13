class CreateLineItems < ActiveRecord::Migration[5.1]
  def change
    create_table :line_items do |t|
      t.integer :item_id
      t.integer :cart_id
      t.integer :quantity, default: 1
      t.timestamps
    end
  end
end
