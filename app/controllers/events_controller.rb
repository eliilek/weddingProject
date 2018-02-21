class EventsController < ApplicationController

	def index
		if params[:job_id_search]
				@event = Event.find_by(job_identification_number: params[:job_id_search])
				if @event
					redirect_to event_path(@event)
				end
		end
		@no_date_events = Event.where("final_date IS NULL AND status != ?", "DEFINITE")
		@ordered_events = Event.where("final_date IS NOT NULL AND status != ?", "DEFINITE").order('final_date ASC')
		@events = @no_date_events + @ordered_events
		if params[:search]
	    	@results = Event.search(params[:search]).order("created_at DESC")
		end
	end

	def show
		@event = Event.find(params[:id])
		@contacts = Contact.where("event_id = #{@event.id}").order(created_at: :desc)
		@documents = Document.where("event_id = #{@event.id}")
		@bands = Band.all
		@contact = Contact.new
		@linked_event = Link.new
		@links = Link.where("event_id = #{@event.id}")
		@restrictions = Restriction.all
		if params[:event]
			@date_param = params[:event][:final_date]
		elsif params[:planning]
			@date_param = params[:planning]

		end
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
		params.require(:event).permit(:contract_sent, :client_first_name, :client_last_name, :planning_date, :final_date, :job_identification_number, :status, :primary_contact, :secondary_contact, :primary_contact_phone, :secondary_contact_phone, :primary_contact_email, :secondary_contact_email, :guests, :inquiry_date, :event_type, :referred_by, :venue, :third_contact, :third_contact_phone, :third_contact_email, :fourth_contact, :fourth_contact_phone, :fourth_contact_email, :start_time, :end_time, :continuous, :contract_price, :ot_price, :sold_by, :number_of_musicians, :number_of_vocalists, :hours, :notes, :planner_name, :planner_email, :planner_phone, :primary_contact_title, :secondary_contact_title, :third_contact_title, :fourth_contact_title, :address_one, :address_two, :city, :state, :zip, :company, :sales_meeting_time, :planner_company, :primary_contact_alternate_phone )
	end

end
