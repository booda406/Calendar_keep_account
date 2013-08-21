class Event < ActiveRecord::Base
	by_star_field :date_time
	belongs_to :company
	has_many :categories
end