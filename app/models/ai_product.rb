class AiProduct < ApplicationRecord
  has_many :ai_products_purposes
  has_many :purposes, through: :ai_products_purposes

  has_many :ai_products_target_companies
  has_many :target_companies,through: :ai_products_target_companies

  has_many :ai_products_target_industries
  has_many :target_industries, through: :ai_products_target_industries
end
