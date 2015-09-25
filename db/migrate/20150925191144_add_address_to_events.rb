class AddAddressToEvents < ActiveRecord::Migration
  def change
  	add_column :events, :address_one, :string
  	add_column :events, :address_two, :string
  	add_column :events, :city, :string
  	add_column :events, :state, :string
  	add_column :events, :zip, :string
  end
end
