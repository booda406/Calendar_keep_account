class ChgeDescriptionToEvents < ActiveRecord::Migration
  def change
  	  	change_column :events, :description, :string
  end
end
