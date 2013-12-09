class AddSumToEvents < ActiveRecord::Migration
  def change
  	add_column :events, :sum, :integer
  	rename_column :events, :status, :count
  end
end
