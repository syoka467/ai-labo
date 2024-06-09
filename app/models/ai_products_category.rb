class AiProductsCategory < ApplicationRecord
  belongs_to :ai_product
  belongs_to :category
end
