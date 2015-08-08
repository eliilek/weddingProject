class AddFourthContactTitleToEvents < ActiveRecord::Migration
  def change
  	  	add_column :events, :fourth_contact_title, :string

  end
end
