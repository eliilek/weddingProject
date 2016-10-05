class CreateDiscounts < ActiveRecord::Migration
  def change
    create_table :discounts do |t|
      t.string :name
      t.string :price
      t.boolean :addition
      t.integer :segment

      t.timestamps null: false
    end
  end
end
