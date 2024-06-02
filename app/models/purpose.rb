class Purpose < ApplicationRecord
  has_many :ai_products_purposes, foreign_key: :purpose_id
  has_many :ai_products, through: :ai_products_purposes
end
