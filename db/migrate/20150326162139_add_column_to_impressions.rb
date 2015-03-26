class AddColumnToImpressions < ActiveRecord::Migration
  def change
    add_column :impressions, :channel_id, :integer
  end
end
