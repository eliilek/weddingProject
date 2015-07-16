class EventsController < ApplicationController
	
	def index
		@events = Event.all
	end

	def show
		@event = Event.find(params[:id])
		@contacts = Contact.where("event_id = #{@event.id}")
		@documents = Document.where("event_id = #{@event.id}")
		@bands = Band.all
	end

	def new
		@event = Event.new
		if Event.all.length == 0
			@job_id = 5001
		else
			@job_id = Event.last.job_identification_number + 1
		end
	end

	def create
		@event = Event.new(event_params)
		if @event.save 
			redirect_to event_path(@event)
		else
			redirect_to new_event_path
		end
	end

	def edit
		@event = Event.find(params[:id])
	end

	def update
		@event = Event.find(params[:id])
    	if @event.update_attributes(event_params)
     		redirect_to event_path(@event)
     	end
    end


	private

	def event_params
		params.require(:event).permit(:client_first_name, :client_last_name, :planning_date, :final_date, :job_identification_number, :status, :primary_contact, :secondary_contact, :primary_contact_phone, :secondary_contact_phone, :primary_contact_email, :secondary_contact_email, :guests )
	end
end
