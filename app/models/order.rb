class Order < ApplicationRecord
  belongs_to :user
  has_many :line_items
  
  def line_item_ids=(ids)
     ids.each do |id|
       line_item = LineItem.find(id)
       self.line_items << line_item
     end
  end

end
