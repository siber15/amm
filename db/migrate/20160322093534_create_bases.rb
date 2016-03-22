class CreateBases < ActiveRecord::Migration
  def change
    create_table :bases do |t|
      t.integer :harbour_id
      t.text :placement
      t.string :ip
      t.DateTime :last_seen
      t.belongs_to :harbour, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
