class RenameColumnInVehicle < ActiveRecord::Migration
  def change
    rename_column :vehicles, :license_pate_state, :license_plate_state
  end
end
