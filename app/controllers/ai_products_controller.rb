class AiProductsController < ApplicationController
  def index
    @ai_products = AiProduct.joins(:categories, :purposes, :chat_gpt_ai_products_introduction).order('RANDOM()').page(params[:page]).per(9)
    @categories = Category.all
    @purposes = Purpose.all
  end

  def show
    @ai_product = AiProduct.joins(:chat_gpt_ai_products_introduction).find(params[:id])

    formatted_faqs = @ai_product.faq.gsub("[", "").gsub("]", "").gsub('"', "").gsub('\n', "").gsub(',', "")
    segments = formatted_faqs.split(/([？。])/).each_slice(2).map(&:join)

    qa_pairs = []
    question = nil

    segments.each do |segment|
      if segment.end_with?("？")
        question = segment.strip
      elsif segment.end_with?("。") && question
        qa_pairs << [question, segment.strip]
        question = nil
      end
    end

    # @qa_pairsにセット
    @qa_pairs = qa_pairs
  end

  def search
    search_word = params[:search]
    category_ids = params[:category] || []
    purpose_ids = params[:purpose] || []

    @categories = Category.all
    @purposes = Purpose.all
    @ai_products = AiProduct.all.page(params[:page]).per(9)
    # @ai_products = @ai_products.where('product_name LIKE ?', "%#{search_word}%")

    if search_word.present?
      @ai_products = @ai_products.where('product_name LIKE ?', "%#{search_word}%")
    end

    if category_ids.any?
      @ai_products = @ai_products.joins(:categories).where(categories: { id: category_ids }).distinct
    end

    if purpose_ids.any?
      @ai_products = @ai_products.joins(:purposes).where(purposes: { id: purpose_ids }).distinct
    end

    respond_to do |format|
      format.html { render :index }
      format.js   { render partial: 'index' }
    end
  end

  # def self.search_for(content, method)
  #   AiProduct.where('name LIKE ?', '%' + content)
  # end

end
