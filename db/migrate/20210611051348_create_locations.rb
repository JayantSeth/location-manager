class CreateLocations < ActiveRecord::Migration[6.1]
  def change
    create_table :locations do |t|
      t.string :location_name 
      t.integer :location_type_id 
      t.string :location_address 
      t.string :comment 
      t.timestamps
    end
  end
end
