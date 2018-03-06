class Order < ApplicationRecord
  belongs_to :user
  has_many :line_items
  belongs_to :address
  accepts_nested_attributes_for :address
  
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
    if @user = User.find_by(email: email)
      @user.orders.select do |order|
        order
      end
    else
      false
    end
  end
  
  def self.search_by_status(status)
    self.all.select do |order|
      order.status == status
    end
  end
  
end
