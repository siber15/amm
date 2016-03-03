class CreateSlips < ActiveRecord::Migration
  def change
    create_table :slips do |t|
      t.string :slip_number
      t.belongs_to :pier, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
