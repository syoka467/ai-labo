class CreateAiProductsTargetIndustries < ActiveRecord::Migration[5.2]
  def change
    create_table :ai_products_target_industries do |t|
      t.integer :product_id

      t.timestamps
    end
  end
end
