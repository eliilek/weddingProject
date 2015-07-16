class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
    	t.string :client_first_name
    	t.string :client_last_name
    	t.string :planning_date
        t.date :final_date
    	t.integer :job_identification_number
    	t.string :status
        t.string :primary_contact
        t.string :secondary_contact
        t.string :primary_contact_phone
        t.string :secondary_contact_phone
        t.string :primary_contact_email
        t.string :secondary_contact_email
        t.integer :guests
    	
    	t.timestamps
    end
  end
end
