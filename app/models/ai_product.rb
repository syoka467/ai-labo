class AiProduct < ApplicationRecord
  has_many :ai_products_purposes, through: :purpose
  has_many :purpose
  has_many :ai_products_target_companies,through: :target_company
  has_many :target_company
  has_many :ai_products_target_industries :target_industry
  has_many :target_industry
end
