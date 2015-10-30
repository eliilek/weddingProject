class AddSalesMeetingTimeToEvents < ActiveRecord::Migration
  def change
  	  	add_column :events, :sales_meeting_time, :date
  end
end
