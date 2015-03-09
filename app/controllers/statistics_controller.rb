class StatisticsController < ApplicationController

	def show
		if params[:name] != nil
			@company = Company.find_by_name(params[:name])
			@statistics = {}

			if @company.nil?
				redirect_to statistics_path
			else
				if params[:start_date].empty? or params[:end_date].empty?
					return false, flash[:notice] = "請選取日期範圍"
				else
					@start_date = Date.strptime(params[:start_date], '%m/%d/%Y')
					@end_date = Date.strptime(params[:end_date], '%m/%d/%Y')
				end
		    	@events = Event.where( company_id: @company.id, date_time: @start_date..@end_date )
				
				if !@events.nil?
					
					Category.all.each do |c|
						@statistics[c.name] = {}
						@statistics[c.name]["count"] = 0
						@statistics[c.name]["price"] = 0
					end
				 	
				 	@events.each do |event|
						@statistics[event.category.name]["count"] += event.capacity
						@statistics[event.category.name]["price"] += event.sum
					end
					
					Rails.logger.debug "statistics----------------#{@statistics}"
				else
					flash[:notice] = ""
				end
			end
		end
	end

end
