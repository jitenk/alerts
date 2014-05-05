class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.integer :person_id
      t.string :avatar
      t.string :primary

      t.timestamps
    end
  end
end
