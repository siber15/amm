class CreateStations < ActiveRecord::Migration
  def change
    create_table :stations do |t|
      t.integer :harbour_id
      t.text :placement
      t.string :ip
      t.datetime :last_seen

      t.timestamps null: false
    end
  end
end
