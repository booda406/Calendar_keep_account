class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.integer :event_id
      t.text :content

      t.timestamps
    end
  end
end
