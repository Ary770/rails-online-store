class AddImgSrcToItems < ActiveRecord::Migration[5.1]
  def change
    add_column :items, :img_src, :string
  end
end
