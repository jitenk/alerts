class AddAlertTypeToQuestion < ActiveRecord::Migration
  def change
    add_column :questions, :alert_type_id, :integer
    add_index :questions, :alert_type_id
  end
end
