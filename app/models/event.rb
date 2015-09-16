class Event < ActiveRecord::Base
	validates :client_first_name, presence: true
	validates :client_last_name, presence: true
	validates :job_identification_number, uniqueness: true
	has_many :contacts
	has_many :documents
	has_many :notifications
	has_many :bookings
	has_many :bands, through: :bookings
	before_save :check_sales_meeting_box
	has_many :links
	before_validation :deal_with_blank_client



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
		elsif self.bookings.length == 0
			nil
		else
			self.bookings
		end
	end

	def check_sales_meeting_box
		if self.status == "SALES MEETING SCHEDULED"
		self.sales_meeting_box = true
		end
	end
	
	def deal_with_blank_client
    	if self.client_first_name == "" and self.client_last_name == ""
    		name_array = primary_contact.split(" ")
    		first_name = name_array[0]
    		second_name = name_array[-1]
    		self.client_first_name = first_name
    		self.client_last_name = second_name
    	end
    end

end

