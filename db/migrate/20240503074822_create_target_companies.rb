class CreateTargetCompanies < ActiveRecord::Migration[5.2]
  def change
    create_table :target_companies do |t|
      t.string :target_company

      t.timestamps
    end
  end
end
