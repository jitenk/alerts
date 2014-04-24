class AddAlertIdToPerson < ActiveRecord::Migration
  def change
    add_column :people, :alert_id, :integer
  end
end
