class LineItemsController < ApplicationController
  
  def create
    if user_signed_in?
      current_user.cart ||= current_user.build_cart ##review this line of code!
      current_user.cart.add_item(params[:item_id])
      current_user.cart.save
      current_user.save
      redirect_to cart_path(current_user.cart)
    else
      flash[:error] = "Please Sign In To Add To Cart"
      redirect_to root_path
    end
  end
  
  def destroy
    remove_line_item
    current_user.cart.save
    redirect_to cart_path(current_user.cart)
  end
  
  private
  
  #maybe move method to cart model
  def remove_line_item
    @line_item = current_user.cart.line_items.find_by(id: params[:id])
    @line_item.delete
  end
  
end
