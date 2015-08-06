class WelcomeController < ApplicationController
  def index
  	# @custom_notifications = Notification.all
 	@notifications_check = Event.where(["updated_at <= ?", 3.days.ago])
 	@notifications = Notification.all
  end

  def meetings
  	@events = Event.where("sales_meeting_box = ?", true)
  end
end
