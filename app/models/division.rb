class Division < ActiveRecord::Base
  has_many :students, class_name: "User", through: :lesson
  has_many :teachers, class_name: "User", through: :subjects
  has_many :subjects, through: :lesson
end
