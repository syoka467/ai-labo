class AiProduct < ApplicationRecord
  has_many :ai_products_purposes, foreign_key: :product_id
  has_many :purpose, through: :ai_products_purposes

  has_many :ai_products_target_companies, foreign_key: :product_id
  has_many :target_company,through: :ai_products_target_companies

  has_many :ai_products_target_industries, foreign_key: :product_id
  has_many :target_industry, through: :ai_products_target_industries
end
