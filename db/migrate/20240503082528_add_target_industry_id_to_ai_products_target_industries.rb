class AddTargetIndustryIdToAiProductsTargetIndustries < ActiveRecord::Migration[5.2]
  def change
    add_column :ai_products_target_industries, :target_industry_id, :integer
  end
end
