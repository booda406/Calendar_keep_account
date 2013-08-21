class WelcomeController < ApplicationController
	def say
	end
	def index
		if params[:year]
			@year = params[:year].to_i
		else
			@year = Time.zone.now.year
		end

		if params[:month]
			@month = params[:month].to_i
		else
			@month = Time.zone.now.month
		end
		if 	@month > 12 
			@year = @year + 1
			@month = 1
		end
		if 	@month < 1
			@year = @year - 1
			@month = 12
		end
	end
end
