class Grade < ActiveRecord::Base
  belongs_to :subject
  belongs_to :student, class_name: 'User', foreign_key: 'student_id'
  has_one :teacher, class_name: 'User', through: :subjects

  scope :student_grades, ->(student_id) { where(student_id: student_id) }
  scope :teacher_grades, ->(teacher_id) { where}
end
