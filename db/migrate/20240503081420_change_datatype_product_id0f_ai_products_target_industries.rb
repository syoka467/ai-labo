class ChangeDatatypeProductId0fAiProductsTargetIndustries < ActiveRecord::Migration[5.2]
  def change
    change_column :ai_products_target_industries, :product_id, :integer
  end
end
