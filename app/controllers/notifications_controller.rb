class NotificationsController < ApplicationController
	
	def new
		@event = Event.find(params[:event_id])
		@notification = Notification.new
	end

	def create
		@event = Event.find(params[:event_id])
		@notification = @event.notifications.new(notification_params)
		if @notification.save 
			redirect_to event_path(@event) 
		end
	end

	def destroy
		Notification.find(params[:id]).destroy
		redirect_to(root_path)
	end

	private

	def notification_params
		params.require(:notification).permit(:name, :notification_date)
	end

end