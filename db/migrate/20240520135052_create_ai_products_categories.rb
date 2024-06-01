class CreateAiProductsCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :ai_products_categories do |t|
      t.integer :ai_prodcut_id
      t.integer :category_id

      t.timestamps
    end
  end
end
