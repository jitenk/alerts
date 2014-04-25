class AddAlertIdToPerson < ActiveRecord::Migration
  def change
    add_column :people, :alert_id, :integer
    add_index :people, :alert_id
  end
end
