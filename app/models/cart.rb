class Cart < ApplicationRecord
  has_many :line_items
  has_many :items, through: :line_items
  belongs_to :user 
  
  def total
    self.items.map do |item| 
      item.price * self.line_items.find_by(item_id: item.id).quantity
      end.sum
  end
  
  def add_item(new_item_id)
    if line_item = self.line_items.find_by(item_id: new_item_id)
      line_item.quantity += 1
      line_item.save
      line_item
    else
      self.line_items.build(item_id: new_item_id.to_i)
    end
  end
end
