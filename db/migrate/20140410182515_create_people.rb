class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.string :last_name
      t.string :first_name
      t.date :birth_date
      t.string :gender
      t.string :hair_color
      t.integer :height_ft
      t.integer :height_inch
      t.integer :weight
      t.string :eye_color
      t.string :race
      t.string :type
      t.integer :age
      t.string :age_unit

      t.timestamps
    end
  end
end
