class CategoriesController < ApplicationController
  def index
    @categories = Category.all

  end

  def show
    @category = Category.find(params[:id])
    @ai_products = AiProduct.joins(:categories).where(categories: { id: @category.id }).page(params[:page]).per(9)
  end
  
end
