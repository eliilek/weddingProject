class Document < ActiveRecord::Base
	validates :title, presence: true
	has_attached_file :data
	validates_attachment_content_type :data, :content_type => ["application/pdf", "application/msword"]

end