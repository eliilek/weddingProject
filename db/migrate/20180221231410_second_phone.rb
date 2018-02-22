class SecondPhone < ActiveRecord::Migration
  def change
    add_column :events, :primary_contact_alternate_phone, :string
  end
end
