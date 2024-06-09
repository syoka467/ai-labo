class AddImageToAiProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :ai_products, :image, :string
  end
end
