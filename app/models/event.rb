class Event < ActiveRecord::Base
	validates_presence_of :name
	by_star_field :date_time
end