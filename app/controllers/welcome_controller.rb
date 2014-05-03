class WelcomeController < ApplicationController
	before_action :authenticate_user!, :only => [ :index]

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
	def company
		@companies = Company.all
	    @company = Company.new
	end
	def create_company
		@company = Company.new(company_params)
		@company.save
		redirect_to company_path
	end
	def category
		@categories = Category.all
	    @category = Category.new
	end
	def create_category
		@category = Category.new(category_params)
		@category.save
		redirect_to category_path
	end

 private

 	def category_params
      params.require(:category).permit(:name)
    end

    def company_params
    	params.require(:company).permit(:name)
    end

end
