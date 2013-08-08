class RenameWhenToEvents < ActiveRecord::Migration
  def change
  	rename_column :events, :when, :date_time 
  end
end
