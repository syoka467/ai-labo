class CreateAiProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :ai_products do |t|
      t.string :company_name
      t.integer :capital
      t.date :establishment_date
      t.text :employee_type
      t.text :business_description
      t.string :product_name
      t.text :description
      t.string :usage_fee_type
      t.integer :usage_fee
      t.integer :initial_cost
      t.boolean :free_plan
      t.boolean :trial
      t.text :faq
      t.string :review

      t.timestamps
    end
  end
end
