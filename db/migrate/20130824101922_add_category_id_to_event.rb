class AddCategoryIdToEvent < ActiveRecord::Migration
  def self.up
    add_column :events, :category_id, :integer
  end

  def self.down
    remove_column :event, :category_id
  end
end
