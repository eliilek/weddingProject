class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
    	t.belongs_to :event
    	t.text :notes
    	t.date :date

    	t.timestamps
    end
  end
end
