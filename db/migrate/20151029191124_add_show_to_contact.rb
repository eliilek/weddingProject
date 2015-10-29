class AddShowToContact < ActiveRecord::Migration
  def change
  	  	add_column :contacts, :show_to, :boolean
  end
end
