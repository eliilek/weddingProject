class Booking < ActiveRecord::Base
	belongs_to :band
	belongs_to :event
	before_save :book_other_evolution
	before_destroy :destroy_other_evolution


	def book_other_evolution
		if self.event_id != nil
			if self.band.id == 1 && self.kind == "BOOKED"
				other_band = Band.find(2)
				b = Booking.new
				b.band = other_band
				b.date = self.date
				b.kind = "BOOKED"
				b.save
			elsif self.band.id == 2 && self.kind == "BOOKED"
				other_band = Band.find(1)
				b = Booking.new
				b.band = other_band
				b.date = self.date
				b.kind = "BOOKED"
				b.save
			end
		end
	end

	def destroy_other_evolution
		if self.event_id != nil
			if self.band.id == 1 && self.kind == "BOOKED"
				booking = Booking.find_by(["band_id = ? and date = ?", 2, self.date])
				Booking.destroy(booking.id)
			elsif self.band.id == 2 && self.kind == "BOOKED"
				booking = Booking.find_by(["band_id = ? and date = ?", 1, self.date])
				Booking.destroy(booking.id)
			end
		end
	end
end