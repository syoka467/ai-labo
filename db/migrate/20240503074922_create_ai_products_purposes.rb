class CreateAiProductsPurposes < ActiveRecord::Migration[5.2]
  def change
    create_table :ai_products_purposes do |t|
      t.integer :product_id
      t.integer :purpose_id

      t.timestamps
    end
  end
end
