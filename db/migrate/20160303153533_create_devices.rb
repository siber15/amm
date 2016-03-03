class CreateDevices < ActiveRecord::Migration
  def change
    create_table :devices do |t|
      t.belongs_to :slip, index: true, foreign_key: true
      t.boolean :active
      t.string :device_number
      t.string :mac_address
      t.datetime :last_seen
      t.datetime :install_date
      t.string :software_version
      t.string :hardware_version
      t.boolean :current_status
      t.datetime :killed_date

      t.timestamps null: false
    end
  end
end
