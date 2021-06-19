class AddLocationIdToLocationIpSchema < ActiveRecord::Migration[6.1]
  def change
    add_column :location_ip_schemas, :location_id, :integer 
  end
end
