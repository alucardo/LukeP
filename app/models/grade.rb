class Grade < ActiveRecord::Base
  belongs_to :subject
  belongs_to :student, class_name: 'User', foreign_key: 'student_id'
end
