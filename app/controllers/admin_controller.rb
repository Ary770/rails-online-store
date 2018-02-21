class AdminController < ApplicationController
  load_and_authorize_resource
  
  def index
  end
  
  def items
    @items = Item.all
  end
  
  def orders
    if !params[:email].blank? && params[:email] != ""
      @orders = Order.search_by_email(params[:email])
    else 
      @orders = Order.all
    end
  end
  
end
