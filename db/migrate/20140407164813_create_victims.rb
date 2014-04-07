class CreateVictims < ActiveRecord::Migration
  def change
    create_table :victims do |t|
      t.string :first_name
      t.string :last_name
      t.string :gender
      t.string :hair_color
      t.date :birth_date
      t.string :eye_color
      t.string :race

      t.timestamps
    end
  end
end
