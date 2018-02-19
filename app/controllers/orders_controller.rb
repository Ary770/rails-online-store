class OrdersController < ApplicationController
  
  def new
    @cart = current_user.cart
    @order = Order.new
  end
  
  def create
    @order = current_user.orders.build(order_params)
    require 'pry'; binding.pry
    @order.save
    #current_user.save
    flash[:notice] = "Your Order Has Been Submitted"
    redirect_to order_path(@order)
  end
  
  def show
    @order = current_user.orders.find_by(id: params[:id])
  end
  
  private
  
  def order_params
     params.require(:order).permit(:total, :status, line_item_ids: [])
  end
  
end
