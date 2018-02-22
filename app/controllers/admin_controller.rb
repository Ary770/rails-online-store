class AdminController < ApplicationController
  load_and_authorize_resource
  
  def index
  end
  
  def items
    @items = Item.all
  end
  
  def orders
    handle_search_logic
  end
  
  private
  
  def handle_search_logic
    if !params[:email].blank? && params[:email] != ""
      @orders = Order.search_by_email(params[:email])
    elsif !params[:order_id].blank? && params[:order_id] != ""
      @orders = Order.search_by_id(params[:order_id])
    elsif !params[:status].blank? && params[:status] != ""
      @orders = Order.search_by_status(params[:status])
    else 
      @orders = Order.all
    end
  end
  
end
