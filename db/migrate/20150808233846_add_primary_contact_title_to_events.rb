class AddPrimaryContactTitleToEvents < ActiveRecord::Migration
  def change
  	add_column :events, :primary_contact_title, :string
  end
end
