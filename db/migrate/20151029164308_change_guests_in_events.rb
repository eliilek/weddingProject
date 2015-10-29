class ChangeGuestsInEvents < ActiveRecord::Migration
  def change
  	change_column :events, :guests, :text
  end
end
