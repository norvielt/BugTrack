# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)



BugList.create( issue_type:'Bug', 
								issue_date: sysdate, 
								priority: 'severe', 
								issue_name: 'Random Bug',
								issue_desc: 'Random bug desc',
								comments: 'No Comments',
								assigned_to_name: 'Taryn',
								assigned_to_email: 'norvielt@gmail.com',
								issue_status: 'pending')
  

