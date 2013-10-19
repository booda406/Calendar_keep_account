class EventsController < ApplicationController
	before_action :find_event, :only => [ :show, :edit, :update, :destroy]
	before_action :authenticate_user!, :only => [ :index, :show, :edit, :new, :update, :destroy]

	def index
  		sort_by = (params[:order] == 'Date') ? 'date_time' : 'created_at'
  		@events = Event.order(sort_by).paginate(:page => params[:page], :per_page => 5)

		respond_to do |format|
    		format.html # index.html.erb
    		format.xml { render :xml => @events.to_xml }
    		format.json { render :json => @events.to_json }
    		format.atom { @feed_title = "My event list" } # index.atom.builder
  		end
	end
	def new
		@event = Event.new(:date_time => params[:date_time])
	end
	def create
		@event = Event.new(event_params)
		if @event.save
			redirect_to events_url
			flash[:notice] = "event was successfully created"
		else
			render :action => :new
		end
	end
	def show
		@page_title = @event.name
		respond_to do |format|
    		format.html { @page_title = @event.name } # show.html.erb
    		format.xml # show.xml.builder
    		format.json { render :json => { id: @event.id, name: @event.name }.to_json }
  		end
	end
	def show_date
		@events = Event.by_day(params[:date_time]).paginate(:page => params[:page], :per_page => 5)
	end
	def edit
	end
	def update
		if @event.update_attributes(event_params)
			redirect_to event_url(@event)
		else
			render :action => :edit
		end
		flash[:notice] = "event was successfully updated"
	end
	def destroy
		@event.destroy
      	redirect_to events_url
 		flash[:alert] = "event was successfully deleted"
	end
	def search
    	@events = Event.where( [ "name like ?", "%#{params[:keyword]}%" ]).paginate(:page => params[:page], :per_page => 5)
    	render :action => :index
	end

	protected

	def find_event
		@event = Event.find(params[:id])
	end
	def event_params
		params.require(:event).permit(:company_id, :category_id, :capacity, :univalent, :sum, :date_time)
	end
end
