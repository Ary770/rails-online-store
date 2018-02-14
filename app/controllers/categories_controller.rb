class CategoriesController < ApplicationController
  def index
    @categories = Category.all
  end
  
  def show
    @category = Category.find_by(id: params[:id]) 
  end
  
  def new
    
  end
  
  def create
    
  end
  
  def update
    
  end
  
  def destroy
    
  end
  
  private
  
  def category_params
    
  end
end
