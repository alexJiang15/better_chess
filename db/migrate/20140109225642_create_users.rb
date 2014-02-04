class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email, null: false
      t.string :name
      t.string :password, null: false
      t.integer :karma, default: 0, null: false
      t.datetime :last_logged_in

      t.timestamps
    end
  end
end
