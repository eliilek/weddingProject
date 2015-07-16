class CreateDocuments < ActiveRecord::Migration
  def change
    create_table :documents do |t|
    	t.belongs_to :event
    	t.string :title
    	t.attachment :data

    	t.timestamps
    end
  end
end
