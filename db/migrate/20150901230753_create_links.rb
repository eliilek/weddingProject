class CreateLinks < ActiveRecord::Migration
  def change
    create_table :links do |t|
    	t.belongs_to :event
    	t.integer :linked_event_job_number

      t.timestamps null: false
    end
  end
end
