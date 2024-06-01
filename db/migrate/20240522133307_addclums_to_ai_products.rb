class AddclumsToAiProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :ai_products, :initial_cost_search, :boolean
    add_column :ai_products, :initial_cost_display, :integer
    add_column :ai_products, :usag_fee_scrape, :string
  end
end
