class Order < ApplicationRecord
  belongs_to :user
  has_many :line_items
  
  def line_item_ids=(ids)
     ids.each do |id|
       line_item = LineItem.find(id)
       self.line_items << line_item
     end
  end
  
  def self.search_by_id(id)
    order_ary = []
    order = self.find_by(id: id)
    order_ary.push(order)
  end
  
  def self.search_by_email(email)
    @user = User.find_by(email: email)
    @user.orders.select do |order|
      order
    end
  end
  
  def self.search_by_status(status)
    self.all.select do |order|
      order.status == status
    end
  end
  
end
