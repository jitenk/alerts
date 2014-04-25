class AddAlertIdToVehicles < ActiveRecord::Migration
  def change
    add_column :vehicles, :alert_id, :integer
    add_index :vehicles, :alert_id
  end
end
