class AddPlannerCompanyToEvent < ActiveRecord::Migration
  def change
  	add_column :events, :planner_company, :string
  end
end
