class Event < ActiveRecord::Base
	validates :client_first_name, presence: true
	validates :client_last_name, presence: true
	has_many :contacts
	has_many :documents
	has_many :notifications
	has_many :bookings
	has_many :bands, through: :bookings
	before_save :check_sales_meeting_box
	has_many :links


	def self.search(search)
		search_split = search.split("")
		numbers_to_string = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "0"]
		if (search_split & numbers_to_string).empty? == false
			search = search.to_i
			return where("job_identification_number = #{search}")			
		else
			return where(['client_first_name LIKE ? OR client_last_name LIKE ? OR status LIKE ?', "%#{search.capitalize}%", "%#{search.capitalize}%","%#{search.upcase}%"])
		end
	end

	def bookings_only
		self.bookings.select {|booking| booking.kind == "BOOKED"}	
	end

	def band
		if self.bookings.length == 1
			self.bookings.first.band
		end
	end

	def check_sales_meeting_box
		if self.status == "SALES MEETING SCHEDULED"
		self.sales_meeting_box = true
		end
	end

end

