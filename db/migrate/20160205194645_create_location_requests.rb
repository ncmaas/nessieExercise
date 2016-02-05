class CreateLocationRequests < ActiveRecord::Migration
  def change
    create_table :location_requests do |t|
      t.float :lat
      t.float :long
      t.integer :radius

      t.timestamps null: false
    end
  end
end
