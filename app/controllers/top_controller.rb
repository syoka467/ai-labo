class TopController < ApplicationController
  def index
    @categories = Category.all
    @ai_products= AiProduct.order("RANDOM()").limit(5)
    
  end
end
