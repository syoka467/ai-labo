class CreateChatGptAiProductsIntroductions < ActiveRecord::Migration[5.2]
  def change
    create_table :chat_gpt_ai_products_introductions do |t|
      t.integer :ai_product_id
      t.text :introduction

      t.timestamps
    end
  end
end
