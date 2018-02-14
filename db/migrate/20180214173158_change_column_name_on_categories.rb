class ChangeColumnNameOnCategories < ActiveRecord::Migration[5.1]
  def change
    rename_column :categories, :title, :name
  end
end
