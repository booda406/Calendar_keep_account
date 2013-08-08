class ChgeWhenToEvents < ActiveRecord::Migration
  def change
  	change_column :events, :when, :datetime
  end
end
