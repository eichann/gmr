class DropTableChannels < ActiveRecord::Migration
  def change
    drop_table :channels
  end
end