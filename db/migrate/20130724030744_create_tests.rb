class CreateTests < ActiveRecord::Migration
  def change
    create_table :tests do |t|
      t.string :name
      t.datetime :start_time

      t.timestamps
    end
  end
end
