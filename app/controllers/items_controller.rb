class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource
  
  def new
    #Validate user for admin.
    @category = Category.find_by(id: params[:category_id]) if params[:category_id]
    @item = Item.new  
  end
  
  def show
  end
  
  def create
    ##validate user is admin! use cancan
    ##clean logic into method
    if @item = Item.find_by(name: params[:item][:name])
      ##maybe show alert that this item already exists, ask if you would like to update
      flash[:error] = "#{@item.name} already exists."
      redirect_to item_path(@item) 
    else
      @item = Item.new(item_params)
      require 'pry'; binding.pry
      if @item.save
        flash[:notice] = "Item has been created"
        redirect_to item_path(@item)
       else
        ## save errors to flash
        render :new
      end
    end
  end
  
  def edit 
  end
  
  def update
    ##validate for user being admin
    if @item.update(item_params)
      redirect_to item_path(@item)
    else
      # save errors to flash, display in edit vie
      redirect_to edit_item(@item)
    end
  end
  
  def destroy
    @item.destroy
    flash[:notice] = "item deleted."
    redirect_to root_path
  end
  
  private
  
  def item_params
    params.require(:item).permit(:name, :inventory, :price, :description, :category_id)
  end
  
  def set_item
    @item = Item.find_by(id: params[:id])
  end
  
end
