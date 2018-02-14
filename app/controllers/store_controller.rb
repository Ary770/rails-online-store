class StoreController < ApplicationController
  
  def index
    @items = Item.all
  end
  
end
