class Notification < ActiveRecord::Base

	def find_event
		@event = Event.find(self.event_id)
	end
	
end