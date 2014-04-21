class AddAddInfoToVehicle < ActiveRecord::Migration
  def change
    add_column :vehicles, :additional_info, :text
  end
end
