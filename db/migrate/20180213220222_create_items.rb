class CreateItems < ActiveRecord::Migration[5.1]
  def change
    create_table :items do |t|
      t.string :title
      t.integer :inventory
      t.integer :price
      t.integer :category_id
      t.timestamps
    end
  end
end
