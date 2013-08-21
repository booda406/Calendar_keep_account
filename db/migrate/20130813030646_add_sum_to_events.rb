class AddSumToEvents < ActiveRecord::Migration
  def change
  	add_column :events, :sum, :integer
  	change_column :events, :status, :integer
  	rename_column :events, :status, :count
  end
end
