class CreateLocationTypes < ActiveRecord::Migration[6.1]
  def change
    create_table :location_types do |t|

      t.timestamps
    end
  end
end
