class ItemsController < ApplicationController
  
  def new
    #Validate user for admin.
    @category = Category.find_by(id: params[:category_id]) if params[:category_id]
    @item = Item.new  
  end
  
  def show
    @item = Item.find_by(id: params[:id])
  end
  
  def create
    ##validate user is admin! use cancan
    if @item = Item.find_by(name: params[:item][:name])
      ##maybe show alert that this item already exists, ask if you would like to update
      flash[:alert] = "#{@item.name} already exists."
      redirect_to item_path(@item) 
    else
      @item = Item.new(item_params)
        if @item.save
        flash[:notice] = "Item has been created"
        redirect_to item_path(@item)
      else
        render :new
      end
    end
  end
  
  def update
    ##validate for user being admin
    
  end
  
  def destroy
    @item = Item.find_by(id: params[:id])
    @item.destroy
    flash[:notice] = "item deleted."
    redirect_to root_path
  end
  
  private
  
  def item_params
    params.require(:item).permit(:name, :inventory, :price, :description, :category_id)
  end
  
end
