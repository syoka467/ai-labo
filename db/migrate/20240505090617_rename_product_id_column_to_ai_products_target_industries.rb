class RenameProductIdColumnToAiProductsTargetIndustries < ActiveRecord::Migration[5.2]
  def change
    rename_column :ai_products_target_industries, :product_id, :ai_product_id
  end
end
