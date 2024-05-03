class RenameProducutIdColumnToAiProductsTargetCompanies < ActiveRecord::Migration[5.2]
  def change
    rename_column :ai_products_target_companies, :producut_id, :product_id
  end
end
