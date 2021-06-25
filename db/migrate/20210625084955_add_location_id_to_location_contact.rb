class AddLocationIdToLocationContact < ActiveRecord::Migration[6.1]
  def change
    add_column :location_contacts, :location_id, :integer 
  end
end
