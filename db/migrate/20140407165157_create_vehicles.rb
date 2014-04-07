class CreateVehicles < ActiveRecord::Migration
  def change
    create_table :vehicles do |t|
      t.string :make
      t.string :model
      t.string :style
      t.integer :year
      t.string :color
      t.string :license_plate_number
      t.string :license_pate_state

      t.timestamps
    end
  end
end
