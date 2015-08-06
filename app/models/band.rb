class Band < ActiveRecord::Base
	has_many :bookings

	def is_free?(check_date)
		band_total_bookings = self.bookings.select { |booking| booking.kind == 'BOOKED' }
		band_bookings = band_total_bookings.select { |booking| booking.date == check_date }
		if band_bookings.length == 0 
			true
		else
			false
		end
	end
	def how_many_holds(check_date)
		total_hold = self.bookings.select {|booking| booking.kind == "HOLD"}
		total_hold.select {|booking| booking.date == check_date}.length
	end


	def holds(check_date)
		total_hold = self.bookings.select {|booking| booking.kind == "HOLD"}
		total_hold.select {|booking| booking.date == check_date}
	end
	
end