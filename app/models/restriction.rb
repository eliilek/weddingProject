class Restriction < ActiveRecord::Base
	belongs_to :band
	validates :start_date, presence: true
	validates :end_date, presence: true

	def is_there_restriction?(time)
		if time >= self.start_date && time <= self.end_date
			return true
		end
		false
	end
end