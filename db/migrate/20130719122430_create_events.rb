class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.text :description
      t.boolean :is_public
      t.integer :capacity
      t.integer :univalent,   limit: 255, default: 0, null: false
      t.datetime :date_time
      t.integer  :sum
      t.integer  :company_id
      t.integer  :category_id

      t.timestamps
    end
  end
end
