class User < ActiveRecord::Base
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_one  :student_division, foreign_key: 'student_id', class_name: 'Division'
  has_many :teacher_subject,   foreign_key: 'teacher_id', class_name: 'Subject'
  has_many :student_grades,    foreign_key: 'student_id', class_name: 'Grade'
end
