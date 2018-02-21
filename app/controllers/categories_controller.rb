class CategoriesController < ApplicationController
  before_action :set_category, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource
  
  def index
    @categories = Category.all
  end
  
  def show
  end
  
  def new
    @category = Category.new
  end
  
  def create
    if @category = Category.find_by(name: params[:category][:name])
      flash[:error] = "#{@category.name} already exists."
      redirect_to category_path(@category) 
    else
      @category = Category.new(category_params)
      if @category.save
        flash[:notice] = "Category has been created"
        redirect_to category_path(@category)
       else
        render :new
      end
    end
  end
  
  def update
    if @category.update(category_params)
      redirect_to category_path(@category)
    else
      redirect_to edit_category(@category)
    end
  end
  
  def destroy
    @category.destroy
    flash[:notice] = "Category deleted."
    redirect_to root_path
  end
  
  private
  
  def category_params
    params.require(:category).permit(:name)
  end
  
  def set_category
    @category = Category.find_by(id: params[:id])
  end
end
