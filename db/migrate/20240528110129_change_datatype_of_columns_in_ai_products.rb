class ChangeDatatypeOfColumnsInAiProducts < ActiveRecord::Migration[5.2]
  def change
    change_column :ai_products, :capital, :string
    change_column :ai_products, :establishment_date, :string
    change_column :ai_products, :initial_cost, :string
    change_column :ai_products, :employee_type, :string
  end
end
