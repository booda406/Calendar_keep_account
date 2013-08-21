class RenameCountToEvents < ActiveRecord::Migration
  def change
  	rename_column :events, :count, :univalent
  end
end
