class DocumentsController < ApplicationController
	skip_before_action :verify_authenticity_token
	
	def new
		@event = Event.find(params[:event_id])
		@document = Document.new
	end

	def create
		@event = Event.find(params[:event_id])
		@document = @event.documents.new(document_params)
		if @document.save 
			redirect_to event_path(@event) 
		end
	end

	private

	def document_params
		params.require(:document).permit(:event_id, :data, :title)
	end

end

k6qTTJV3D+S6mem/ywjv2V1EdqiyCb1n10ZusVr7f69amGgD9TUkbai+zZdIDdh4IFirwlbQeazTdgsOLQZ9pg==