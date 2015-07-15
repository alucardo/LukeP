class User < ActiveRecord::Base
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :student_divisions, foreign_key: "student_id", class_name: "User", through: :lesson
  has_many :teacher_subject, foreign_key: "teacher_id", class_name: "User"
  has_many :student_grades, foreign_key: "student_id", class_name: "User"
end
