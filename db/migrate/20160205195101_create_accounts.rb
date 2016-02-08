class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.string :uid
      t.string :the_type
      t.string :nickname
      t.integer :rewards
      t.integer :balance
      t.string :account_number
      t.string :customer_id

      t.timestamps null: false
    end
  end
end
