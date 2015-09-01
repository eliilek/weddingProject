class LinkedEventsController < ApplicationController

	def new 
		@event = Event.find(params[:event_id])
		@linked_event = @event.links.new(linked_event_params)
	end
	def create
		@event = Event.find(params[:event_id])
		@linked_event = @event.links.new(linked_event_params)
		if @contact.save 
			redirect_to event_path(@event) 
		end
	end

	private

	def linked_event_params
		params.require(:links).permit(:event_id, :linked_event_job_number)
	end
end