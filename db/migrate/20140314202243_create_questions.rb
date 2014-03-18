class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.integer :order
      t.text :detail

      t.timestamps
    end
  end
end
