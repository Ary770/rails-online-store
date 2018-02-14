class CartsController < ApplicationController
  def show
    @cart = Cart.find_by(id: params[:id])
  end
  
  def checkout
    current_user.cart.status = "submitted"
    current_user.cart.save
    update_inventory
    @submitted_cart_id = current_user.cart
    reset_current_cart
    redirect_to cart_path(@submitted_cart_id)
  end
  
  private
  
  def update_inventory
    current_user.cart.items.each do |item|
      @line_item = current_user.cart.line_items.find_by(item_id: item.id)
      item.inventory -= @line_item. quantity
      item.save
    end
  end
  
  def reset_current_cart
    current_user.cart= nil
    current_user.save
  end
end
