class Link < ActiveRecord::Base
	belongs_to :event
	validates :event_id, :linked_event_job_number, presence: true
end
