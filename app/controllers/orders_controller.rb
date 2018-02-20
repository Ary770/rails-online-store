class OrdersController < ApplicationController
  load_and_authorize_resource
  
  def index
    @orders = current_user.orders
  end
  
  def new
    @cart = current_user.cart
    @order = Order.new
  end
  
  def create
    @order = current_user.orders.build(order_params)
    @order.save
    update_inventory
    reset_current_cart
    flash[:notice] = "Your Order Has Been Submitted"
    redirect_to order_path(@order)
  end
  
  def show
    @order = current_user.orders.find_by(id: params[:id])
  end
  
  def admin_order
    if current_user.admin
      @order = Order.find(params[:id])
    else
      redirect_to root_path
    end
  end
  
  private
  
  def order_params
     params.require(:order).permit(:total, :status, line_item_ids: [])
  end
  
  def update_inventory
    current_user.cart.items.each do |item|
      @line_item = current_user.cart.line_items.find_by(item_id: item.id)
      item.inventory -= @line_item. quantity
      item.save
    end
  end
  
  def reset_current_cart
    current_user.cart.destroy
    current_user.cart = nil
    current_user.save
  end
  
end
