class AddContractSentToEvents < ActiveRecord::Migration
  def change
  	add_column :events, :contract_sent, :date
  end
end
