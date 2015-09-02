class LinksController < ApplicationController

	def new 
		@event = Event.find(params[:event_id])
		@linked_event = @event.links.new(links_params)
	end
	def create
		@event = Event.find(params[:event_id])
		@linked_event = @event.links.new(links_params)
		if @linked_event.save 
			redirect_to event_path(@event) 
		end
	end
	def destroy
		Link.find(params[:id]).destroy
		redirect_to :back
	end

	private

	def links_params
		params.require(:link).permit(:linked_event_job_number)
	end
end