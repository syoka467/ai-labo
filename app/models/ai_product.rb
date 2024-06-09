class AiProduct < ApplicationRecord
  has_many :ai_products_purposes
  has_many :purposes, through: :ai_products_purposes

  has_many :ai_products_target_companies
  has_many :target_companies,through: :ai_products_target_companies

  has_many :ai_products_target_industries
  has_many :target_industries, through: :ai_products_target_industries

  has_many :chat_gpt_products_introductions
  
  has_many :ai_products_categories
  has_many :categories, through: :ai_products_categories

  has_one :chat_gpt_ai_products_introduction
  def image_path
    ActionController::Base.helpers.asset_path(image)
  end
end
