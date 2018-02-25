class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource
  
  def new
    if params[:category_id]
      @category = Category.find_by(id: params[:category_id])
      @item = Item.new
    else
      @category = Category.new
      @item = Item.new
    end
  end
  
  def show
  end
  
  def create
    @item = Item.new(item_params)
    if @item.save
      flash[:notice] = "Item has been created"
      redirect_to item_path(@item)
     else
      render :new
    end
  end
  
  def edit
  end
  
  def update
    @item.update(item_params)
    if @item.save  
      redirect_to item_path(@item)
    else
      render :edit
    end
  end
  
  def destroy
    @item.destroy
    flash[:notice] = "item deleted."
    redirect_to root_path
  end
  
  private
  
  def item_params
    params.require(:item).permit(:name, :inventory, :price, :description, :category_id, :img_src)
  end
  
  def set_item
    @item = Item.find_by(id: params[:id])
  end
  
end
