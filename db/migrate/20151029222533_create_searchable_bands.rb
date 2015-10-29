class CreateSearchableBands < ActiveRecord::Migration
  def change
    create_table :searchables do |t|
    	t.string :name
    end
  end
end
