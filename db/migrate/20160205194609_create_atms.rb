class CreateAtms < ActiveRecord::Migration
  def change
    create_table :atms do |t|
      t.float :lat
      t.float :long
      t.string :uid
      t.string :name
      t.string :languages
      t.string :hours
      t.boolean :accessibility
      t.integer :amount_left

      t.timestamps null: false
    end
  end
end
