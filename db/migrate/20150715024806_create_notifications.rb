class CreateNotifications < ActiveRecord::Migration
  def change
    create_table :notifications do |t|
    	t.string :name
    	t.date :notification_date
    	t.belongs_to :event

    	t.timestamps
    end
  end
end
