class AddLinkedEventsToEvents < ActiveRecord::Migration
  def change
  	add_column :events, :linked_events, :text, array: true, default: []
  end
end
