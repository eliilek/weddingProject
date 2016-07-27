class Event < ActiveRecord::Base
	validates :client_first_name, presence: true
	validates :client_last_name, presence: true
	validates :job_identification_number, uniqueness: true, on: :create
	has_many :contacts
	has_many :documents
	has_many :notifications
	has_many :bookings
	has_many :bands, through: :bookings
	before_save :check_sales_meeting_box
	has_many :links
	before_validation :deal_with_blank_client
	before_validation :clean_phone_numbers


	def clean_phone_numbers
		if self.primary_contact_phone != "" and self.primary_contact_phone != nil
			self.primary_contact_phone = self.primary_contact_phone.scan(/[0-9]/).join
		end
		if self.secondary_contact_phone != "" and self.secondary_contact_phone != nil
			self.secondary_contact_phone = self.secondary_contact_phone.scan(/[0-9]/).join
		end
		if self.third_contact_phone != "" and self.third_contact_phone != nil
			self.third_contact_phone = self.third_contact_phone.scan(/[0-9]/).join
		end
		if self.fourth_contact_phone != "" and self.fourth_contact_phone != nil
			self.fourth_contact_phone = self.fourth_contact_phone.scan(/[0-9]/).join
		end
	end

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
		if self.client_first_name == "" or self.client_first_name == nil
    		if self.primary_contact == "" or self.primary_contact == nil
    			if self.planner_company == "" or self.planner_company == nil
    				self.primary_contact = "Client of " + self.planner_name
    			else
	    			self.primary_contact = "Client of " + self.planner_company
	    		end
    		end
	    	name_array = self.primary_contact.split(" ")
    		first_name = name_array[0]
    		name_array.shift
    		second_name = name_array.join(" ")
    		self.client_first_name = first_name
    		self.client_last_name = second_name
    	end
    end

    def show_on(time, band=0)
    	if self.final_date && self.final_date == time
    		return true
    	end
    	self.bookings.each do |booking|
    		if booking.date == time
				if band == 0
					return true
				elsif booking.band_id == band || (booking.band_id == 6 and band == 5)
					return true
				end
    		end
    	end
    	return false
    end

end
