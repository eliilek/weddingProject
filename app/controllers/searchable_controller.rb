class SearchableController < ApplicationController
	def new
		@search = Searchable.new
	end

	def create
		@search = Searchable.new
		@search.save
	end
end