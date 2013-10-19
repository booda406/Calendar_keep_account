class RenameDescriptionToCategories < ActiveRecord::Migration
  def change
  	rename_column :categories, :description, :name
  end
end
