class AddThirdContactTitleToEvents < ActiveRecord::Migration
  def change
  	  	add_column :events, :third_contact_title, :string

  end
end
