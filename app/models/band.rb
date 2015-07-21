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
	def how_many_holds
		self.bookings.select {|booking| booking.kind == "HOLD"}.length
	end
	
end