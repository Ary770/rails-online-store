class AdminController < ApplicationController
  load_and_authorize_resource

  def index
  end

  def items
    @items = Item.all
    respond_to do |format|
      format.html { render :items }
      format.json { render json: @items }
    end
  end

  def orders
    handle_search_logic
  end

  private

  def handle_search_logic
    if @orders = Order.search_by_email(params[:email])
      @orders
    elsif !params[:order_id].blank? && params[:order_id] != "" && params[:order_id].to_i != 0
      @orders = Order.search_by_id(params[:order_id])
    elsif !params[:status].blank? && params[:status] != ""
      @orders = Order.search_by_status(params[:status])
    else
      @orders = Order.all
    end
  end

end
