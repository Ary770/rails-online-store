class LineItemsController < ApplicationController
  
  def create
    if user_signed_in?
      current_user.cart ||= current_user.build_cart ##review this line of code!
      current_user.cart.add_item(params[:item_id])
      current_user.cart.save
      current_user.save
      redirect_to cart_path(current_user.cart)
    else
      redirect_to root_path
    end
  end
  
end
