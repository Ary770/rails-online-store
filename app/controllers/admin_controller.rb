class AdminController < ApplicationController
  load_and_authorize_resource
  
  def index
  end
  
  def items
    @items = Item.all
  end
  
  def orders
    @orders = Order.all
  end
  
end
