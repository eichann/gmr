class CreateChannels < ActiveRecord::Migration
  def change
    create_table :channels do |t|
      t.string :name
      t.text :description
      t.string :password
      t.boolean :enable_request, null: false, default: true
      t.timestamps
    end
  end
end
