class CreateAlerts < ActiveRecord::Migration
  def change
    create_table :alerts do |t|
      t.string :the_type
      t.string :description
      t.datetime :time
      t.string :merchant
      t.integer :amount
      t.string :user_id

      t.timestamps null: false
    end
  end
end
