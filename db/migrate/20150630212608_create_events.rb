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
        t.date :inquiry_date
        t.string :event_type
        t.string :referred_by
        t.string :venue
        t.string :third_contact
        t.string :third_contact_phone
        t.string :third_contact_email
        t.string :fourth_contact
        t.string :fourth_contact_phone
        t.string :fourth_contact_email
        t.string :start_time
        t.string :end_time
        t.string :continuous
        t.string :contract_price
        t.string :ot_price
        t.string :sold_by
        t.string :number_of_musicians
        t.string :number_of_vocalists
        t.string :hours
        t.string :notes
        t.string :planner_name
        t.string :planner_email
        t.string :planner_phone
    	
    	t.timestamps
    end
  end
end