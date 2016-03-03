class CreatePiers < ActiveRecord::Migration
  def change
    create_table :piers do |t|
      t.belongs_to :harbour, index: true, foreign_key: true
      t.string :name

      t.timestamps null: false
    end
  end
end
