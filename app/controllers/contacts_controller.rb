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
		else
			@errors = "Please include a date"
			redirect_to event_path(@event) 
		end
	end

	def destroy
		Contact.find(params[:id]).destroy
		redirect_to :back
	end

	private

	def contact_params
		params.require(:contact).permit(:event_id, :notes, :date, :show_to)
	end

end