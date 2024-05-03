class CreateTargetIndustries < ActiveRecord::Migration[5.2]
  def change
    create_table :target_industries do |t|
      t.string :target_industry

      t.timestamps
    end
  end
end
