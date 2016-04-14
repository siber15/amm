class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.integer :user_type
      t.string :email
      t.string :password
      t.string :name

      t.timestamps null: false
    end
  end
end
