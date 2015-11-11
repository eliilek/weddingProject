class Contact < ActiveRecord::Base
	belongs_to :event
	validates :date, presence: true
end