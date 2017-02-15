class CreateBugList < ActiveRecord::Migration
  def change
    create_table :BugList do |t|
    t.string   :issue_type
    t.timestamps   :issue_date
    t.string :priority_level
    t.string :issue_name
		t.string :issue_desc
		t.string :comments
		t.string :assigned_to_name
		t.string :assigned_to_email
		t.string :issue_status
    t.timestamps null: false
    end
  end
end



    

