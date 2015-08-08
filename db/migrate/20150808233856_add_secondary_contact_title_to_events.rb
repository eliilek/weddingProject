class AddSecondaryContactTitleToEvents < ActiveRecord::Migration
  def change
  	  	add_column :events, :secondary_contact_title, :string
  end
end
