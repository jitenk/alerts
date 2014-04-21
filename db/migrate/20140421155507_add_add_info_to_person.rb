class AddAddInfoToPerson < ActiveRecord::Migration
  def change
    add_column :people, :additional_info, :text
  end
end
