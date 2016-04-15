class CreateLogs < ActiveRecord::Migration
  def change
    create_table :logs do |t|
      t.integer :device_id
      t.boolean :status
      t.integer :battery
      t.datetime :station_timestamp
      t.integer :station_id

      t.timestamps null: false
    end
  end
end
