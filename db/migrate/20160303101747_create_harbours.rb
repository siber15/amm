class CreateHarbours < ActiveRecord::Migration
  def change
    create_table :harbours do |t|
      t.string :name
      t.string :address
      t.string :zip
      t.string :city
      t.string :country, default: "DK"
      t.integer :phone
      t.text :description
      t.boolean :active, default: true

      t.timestamps null: false
    end
  end
end
