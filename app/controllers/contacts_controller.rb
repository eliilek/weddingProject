class ContactsController < ApplicationController
	

	def new
		@event = Event.find(params[:event_id])
		@contact = Contact.new
	end

	def create
		@event = Event.find(params[:event_id])
		@contact = @event.contacts.new(contact_params)
		if @contact.save 
			redirect_to event_path(@event) 
		end
	end

	private

	def contact_params
		params.require(:contact).permit(:event_id, :notes, :date)
	end

end