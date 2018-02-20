class AdminController < ApplicationController
  load_and_authorize_resource
  
  def index
  end
  
  def items_idex
    @items = Item.all
  end
  
  def orders
    @orders = Order.all
  end
  
  def show_order
    require 'pry'; binding.pry
    @order = Order.find(params[:id])
  end
  
end
