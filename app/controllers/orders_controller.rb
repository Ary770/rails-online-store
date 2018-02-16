class OrdersController < ApplicationController
  
  def new
    @cart = current_user.cart
    @order = Order.new
  end
  
  def create
    require 'pry'; binding.pry
    
  end
  
  
end
