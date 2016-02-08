class CreateTransfers < ActiveRecord::Migration
  def change
    create_table :transfers do |t|
      t.string :uid
      t.string :the_type
      t.string :date
      t.string :status
      t.string :medium
      t.string :payer_id
      t.string :payee_id
      t.integer :amount
      t.string :description

      t.timestamps null: false
    end
  end
end
