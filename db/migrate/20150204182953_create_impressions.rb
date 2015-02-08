class CreateImpressions < ActiveRecord::Migration
  def change
    create_table :impressions do |t|
      t.string :url
      t.integer :status

      t.timestamps
    end
  end
end
