class AddAlertIdToVehicles < ActiveRecord::Migration
  def change
    add_column :vehicles, :alert_id, :integer
  end
end
