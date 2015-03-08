class StatisticsController < ApplicationController

	def show
		if params[:name] != nil
			@company = Company.find_by_name(params[:name])
			@statistics = {}
			if @company.nil?
				redirect_to statistics_path
			else
				start_date = Date.strptime(params[:start_date], '%m/%d/%Y')
				end_date = Date.strptime(params[:end_date], '%m/%d/%Y')
		    	@events = Event.where( company_id: @company.id, date_time: start_date..end_date )
				if !@events.nil?
					Category.all.each do |c|
						@statistics[c.name] = 0
					end
					Rails.logger.debug "statistics----------------#{@statistics}"
				 	@events.each do |event|
						@statistics[event.category.name] += event.capacity
					end
				else
					flash[:notice] = ""
				end
			end
		end
	end

end
