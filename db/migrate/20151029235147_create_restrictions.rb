class CreateRestrictions < ActiveRecord::Migration
  def change
    create_table :restrictions do |t|
    	t.belongs_to :band
    	t.date :start_date
    	t.date :end_date
    	t.string :notes
    end
  end
end
