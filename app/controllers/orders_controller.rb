class OrdersController < ApplicationController
  load_and_authorize_resource
  
  def index
    @orders = current_user.orders
  end
  
  def new
    @cart = current_user.cart
    @order = Order.new
    
    @order.build_address
  end
  
  def create
    @order = current_user.orders.build(order_params)
    @order.save
    current_user.cart.update_inventory
    current_user.cart.reset_cart
    current_user.save
    flash[:notice] = "Your Order Has Been Submitted"
    redirect_to order_path(@order)
  end
  
  def show
    if @order = current_user.orders.find_by(id: params[:id])
      #render show
    else
      redirect_to orders_path
    end
  end
  
  def admin_order
    if current_user.admin
      @order = Order.find(params[:id])
    else
      redirect_to root_path
    end
  end
  
  def update
    if current_user.admin
      @order = Order.find(params[:id])
      @order.status = params[:order][:status]
      @order.save
      redirect_to admin_orders_path
    else
      redirect_to root_path
    end
  end
  
  private
  
  def order_params
     params.require(:order).permit(:total, :status, line_item_ids: [], address_attributes: [:name,
      :street_address, :city, :state, :zipcode, :address_type, :user_id])
  end
  
  # def reset_current_cart
  #   current_user.cart.destroy
  #   current_user.cart = nil
  #   current_user.save
  # end
  
end
