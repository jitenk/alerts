class CreateAlerts < ActiveRecord::Migration
  def change
    create_table :alerts do |t|
      t.string :victims_names
      t.string :suspects_names
      t.string :status
      t.string :type

      t.timestamps
    end
  end
end
