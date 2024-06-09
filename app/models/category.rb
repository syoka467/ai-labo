class Category < ApplicationRecord
  has_many :ai_products_categories
  has_many :ai_products, through: :ai_products_categories
end
