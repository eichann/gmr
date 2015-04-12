class AddClomunsToChannels < ActiveRecord::Migration
  def change
    add_column :channels, :password, :string
    add_column :channels, :enable_request, :boolean, null: false, default: 1
  end
end
