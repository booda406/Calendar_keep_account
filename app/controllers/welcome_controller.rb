class WelcomeController < ApplicationController
	before_action :authenticate_user!, :only => [ :index]
	before_action :set_company, only: [:edit_company, :update_company, :destroy_company]
	before_action :set_category, only: [:edit_category, :update_category, :destroy_category]


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
	def edit_company

	end
	def update_company
      respond_to do |format|
        if @company.update(company_params)
          format.html { redirect_to company_path, notice: 'Company was successfully updated.' }
          format.json { head :no_content }
        end
      end
  	end
  	def destroy_company
    @company.destroy
      respond_to do |format|
      	format.html { redirect_to company_url }
      	format.json { head :no_content }
      end
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
	def edit_category

	end
	def update_category
      respond_to do |format|
        if @category.update(category_params)
          format.html { redirect_to category_path, notice: 'Category was successfully updated.' }
          format.json { head :no_content }
        end
      end
  	end
  	def destroy_category
    @category.destroy
      respond_to do |format|
      	format.html { redirect_to category_url }
      	format.json { head :no_content }
      end
  	end


 private

 	def set_company
 		@company = Company.find(params[:id])
 	end

 	def set_category
 		@category = Category.find(params[:id])
 	end

 	def category_params
      params.require(:category).permit(:name)
    end

    def company_params
    	params.require(:company).permit(:name)
    end

end
