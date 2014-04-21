class AddDateTimeLocationToAlert < ActiveRecord::Migration
  def change
    add_column :alerts, :last_seen, :datetime
    add_column :alerts, :last_known_address, :string
    add_column :alerts, :last_known_city, :string
    add_column :alerts, :last_known_state, :string
    add_column :alerts, :last_known_county, :string
    add_column :alerts, :last_known_zip, :string

    add_column :alerts, :site_of_incident, :text

    add_column :alerts, :nic, :string

    add_column :alerts, :agency_name, :string
    add_column :alerts, :agency_phone, :string


    add_column :alerts, :reporting_agency_phone, :string
    add_column :alerts, :reporting_agency_email, :string


    add_column :alerts, :investigating_officer_name, :string
    add_column :alerts, :investigating_officer_title, :string
    add_column :alerts, :investigating_officer_phone, :string

  end
end
