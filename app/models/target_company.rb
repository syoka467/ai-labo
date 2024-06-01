class TargetCompany < ApplicationRecord
  has_many :ai_products_target_companies,foreign_key: :target_company_id
  has_many :ai_products, through: :ai_products_target_companies
end
