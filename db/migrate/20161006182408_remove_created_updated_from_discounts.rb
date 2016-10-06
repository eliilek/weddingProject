class RemoveCreatedUpdatedFromDiscounts < ActiveRecord::Migration
  def change
    remove_column :discounts, :created_at, :datetime
    remove_column :discounts, :updated_at, :datetime
  end
end
