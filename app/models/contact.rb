class Contact < ActiveRecord::Base
	validates :date, presence: true
end