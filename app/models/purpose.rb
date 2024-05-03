class Purpose < ApplicationRecord
  has_many :ai_products_purposes, through: :ai_products
  has_many :ai_products
end
