class ChangeUnivalentToEvents2 < ActiveRecord::Migration
  def change
  	change_column :events, :univalent, :integer, :default => 0, :null => false
  end
end
