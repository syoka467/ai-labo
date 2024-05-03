class CreateAiProductsTargetCompanies < ActiveRecord::Migration[5.2]
  def change
    create_table :ai_products_target_companies do |t|
      t.integer :producut_id
      t.integer :target_company_id

      t.timestamps
    end
  end
end
