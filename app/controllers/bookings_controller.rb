class BookingsController < ApplicationController


	def new
		@booking = Booking.new
		@event = Event.find(params[:event_id])
		@band = Band.find(params[:band_id])
	end

	def create
		@event = Event.find(params[:event_id])
		@booking = @event.bookings.new(booking_params)
		if @booking.save 
			redirect_to event_path(@event) 
		end
	end

	def destroy
		@event = Event.find(params[:event_id])
		Booking.find(params[:id]).destroy
		redirect_to(event_path(@event))
	end

	def booking_params
		params.require(:booking).permit(:date, :kind, :band_id)
	end

end