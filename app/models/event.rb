class Event < ActiveRecord::Base
	by_star_field :date_time
	belongs_to :company
	belongs_to :category
	validates_presence_of :category_id, :company_id
end