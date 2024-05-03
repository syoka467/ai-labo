class TargetIndustry < ApplicationRecord
  has_many :ai_products_target_industries,foreign_key: :target_industry_id
  has_many :ai_products, through: :ai_products_target_industries
end
