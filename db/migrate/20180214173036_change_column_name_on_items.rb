class ChangeColumnNameOnItems < ActiveRecord::Migration[5.1]
  def change
    rename_column :items, :title, :name
  end
end
