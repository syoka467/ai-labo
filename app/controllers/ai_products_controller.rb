class AiProductsController < ApplicationController
  def index
    @ai_products = AiProduct.includes(:categories)

    if params[:product_name].present?
      @ai_products = @ai_products.where(product_name:"%#{params[:product_name]}%")
    end

    @ai_products= AiProduct.order("RANDOM()").limit(9)
  end

  def show
    @ai_product = AiProduct.find(params[:id])
  end

  def self.search_for(content, method)
    AiProduct.where('name LIKE ?', '%' + content)
  end

end
