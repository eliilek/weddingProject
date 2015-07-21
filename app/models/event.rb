class Event < ActiveRecord::Base
	validates :client_first_name, presence: true
	validates :client_last_name, presence: true
	has_many :contacts
	has_many :documents
	has_many :notifications
	has_many :bookings
end