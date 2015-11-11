class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  before_action :authenticate_user!
  helper_method :saturdays
  	def saturdays
	    d = Date.today
    	while not d.wday== 6
    		d += 1
    	end
    	arr = []
    	while d.year < Date.today.year + 2
    		arr << d
    		d += 7
    	end
   		arr
   	end

end
