class CreateTransferRequests < ActiveRecord::Migration
  def change
    create_table :transfer_requests do |t|
      t.string :medium
      t.string :payee_id
      t.integer :amount
      t.string :transaction_date
      t.string :status
      t.string :description

      t.timestamps null: false
    end
  end
end
