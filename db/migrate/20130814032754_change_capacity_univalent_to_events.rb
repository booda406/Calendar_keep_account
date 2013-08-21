class ChangeCapacityUnivalentToEvents < ActiveRecord::Migration
  def change
  	change_column :events, :capacity, :integer, :default => 0, :null => false
  	change_column :events, :univalent, :integer, :default => 0, :null => false
  end
end
