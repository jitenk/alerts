class CreateAlertTypes < ActiveRecord::Migration
  def change
    create_table :alert_types do |t|
      t.string :name

      t.timestamps
    end
  end
end
