class RenameAiProdcutIdToNewAiProductId < ActiveRecord::Migration[5.2]
  def change
    rename_column :ai_products_categories, :ai_prodcut_id, :ai_product_id
    end
end
