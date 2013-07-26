class AddYearMonthToEvent < ActiveRecord::Migration
  def change
    add_column :events, :year, :integer
    add_column :events, :month, :integer
    add_column :events, :first_day_of_week, :integer
  end
end
