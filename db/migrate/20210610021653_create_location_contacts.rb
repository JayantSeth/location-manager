class CreateLocationContacts < ActiveRecord::Migration[6.1]
  def change
    create_table :location_contacts do |t|
      t.string :name 
      t.string :number
      t.string :email
      t.string :comment
      t.timestamps
    end
  end
end
