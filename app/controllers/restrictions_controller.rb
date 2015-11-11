class RestrictionsController < ApplicationController
	
	def new
		@restriction = Restriction.new
	end

	def create
		@restriction = Restriction.new(restriction_params)
		if @restriction.save 
			redirect_to root_path
		else
			@errors = "Please include a date"
			redirect_to bands_path 
		end
	end

	def destroy
		Restriction.find(params[:id]).destroy
		redirect_to bands_path
	end


	private

	def restriction_params
		params.require(:restriction).permit(:band_id, :start_date, :end_date, :notes)
	end

end