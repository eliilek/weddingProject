class AddTravelInfoToEvent < ActiveRecord::Migration
  def change
    add_column :events, :sound_production, :integer
    add_column :events, :travel_fee, :integer
    add_column :events, :destination_airport, :string
    add_column :events, :travel_checkboxes, :string
  end
end
