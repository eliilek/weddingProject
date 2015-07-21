class CreateBookings < ActiveRecord::Migration
  def change
    create_table :bookings do |t|
    	t.belongs_to :band
    	t.belongs_to :event
    	t.date :date
    	t.string :kind

    	t.timestamps
    end
  end
end
