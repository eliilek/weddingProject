class WelcomeController < ApplicationController
  def index
  	# @custom_notifications = Notification.all
  @no_date_events = Event.where(["final_date IS NULL AND updated_at <= ?", 3.days.ago])
  @ordered_events = Event.where(["final_date IS NOT NULL AND updated_at <= ?", 3.days.ago]).order('final_date ASC')
 	@notifications_check = @no_date_events + @ordered_events

 	notifications = Notification.all
  non_nil = notifications.reject {|notification| notification.find_event.final_date == nil}
  are_nil = notifications.reject {|notification| notification.find_event.final_date != nil}
  sort_non_nil = non_nil.sort_by { |notification| notification.find_event.final_date }
  @notifications = are_nil + sort_non_nil
  end

  def meetings
  	@events = Event.where("sales_meeting_box = ?", true)
  end

  def bands
    if params[:band_id]
      @bands_param = params[:band_id]
      @band = Band.find(params[:band_id])
    end
    @restrictions = Restriction.all
  	@saturdays = saturdays
  	@events = Event.all
    bookings = Booking.order('date')
    good_bookings = []
    bookings.each do |booking|
      if booking.event != nil and booking.event != "" and booking.event.status != "RELEASED" and booking.event.status != "BAB" and booking.event.status != "BADJ" and booking.event.status != "RELEASED-$$$" and booking.event.status != "BAB-$$$" and booking.event.status != "BADJ-$$$" and booking.event.status != "RELEASED-FULLY BOOKED" && bookingevent.status != "RELEASED-BAB" and booking.event.status != "RELEASED-BADJ" and good_bookings.exclude?(booking.date)
        good_bookings << booking.date
      end
    end
    @bookings = good_bookings 
  end

  def opportunities
    @events = Event.where("status = ?", "OPPORTUNITY")
    if params[:search]
      @opp = Event.where("status = ?", "OPPORTUNITY").search(params[:search]).order("created_at DESC")
    end
  end
end
