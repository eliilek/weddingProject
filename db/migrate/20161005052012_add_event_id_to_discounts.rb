class AddEventIdToDiscounts < ActiveRecord::Migration
  def change
    add_column :discounts, :event_id, :integer
    add_index :discounts, :event_id
  end
end
