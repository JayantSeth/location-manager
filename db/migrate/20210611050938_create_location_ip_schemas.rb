class CreateLocationIpSchemas < ActiveRecord::Migration[6.1]
  def change
    create_table :location_ip_schemas do |t|
      t.string :network 
      t.string :subnet
      t.string :comment
      t.timestamps
    end
  end
end
