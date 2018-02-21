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
    self.find_by(id: id)
  end
  
  def self.search_by_email(email)
    @user = User.find_by(email: email)
    @user.orders.select do |order|
      order
    end
  end
  
  def self.order_by_latest
    self.order(created_at: :desc)
  end
  
end
