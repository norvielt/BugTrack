class Bug < ActiveRecord::Base
  validates :issue_type, :issue_date, :issue_name, :priority_level, :issue_desc, :issue_status, :presence => true #, :uniqueness => true
  validates_format_of :assigned_to_email, :with => /@/
end
