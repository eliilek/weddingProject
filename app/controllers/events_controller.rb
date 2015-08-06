class EventsController < ApplicationController
	
	def index
		@events = Event.all
		@ordered_events = @events.order('job_identification_number ASC')
		if params[:search]
	    	@results = Event.search(params[:search]).order("created_at DESC")
		end
	end

	def show
		@event = Event.find(params[:id])
		@contacts = Contact.where("event_id = #{@event.id}")
		@documents = Document.where("event_id = #{@event.id}")
		@bands = Band.all
		@contact = Contact.new
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
		params.require(:event).permit(:client_first_name, :client_last_name, :planning_date, :final_date, :job_identification_number, :status, :primary_contact, :secondary_contact, :primary_contact_phone, :secondary_contact_phone, :primary_contact_email, :secondary_contact_email, :guests, :inquiry_date, :event_type, :referred_by, :venue, :third_contact, :third_contact_phone, :third_contact_email, :fourth_contact, :fourth_contact_phone, :fourth_contact_email, :start_time, :end_time, :continuous, :contract_price, :ot_rate, :sold_by, :number_of_musicians, :number_of_vocalists, :hours, :notes, :planner_name, :planner_email, :planner_phone )
	end

end

