class RemoveYearFromEvents < ActiveRecord::Migration
  def change
  	remove_column :events, :year
  	remove_column :events, :month
  	remove_column :events, :first_day_of_week
  end
end
