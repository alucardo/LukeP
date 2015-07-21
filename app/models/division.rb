class Division < ActiveRecord::Base
  has_many :students, class_name: 'User'
  has_many :teachers, class_name: 'User', through: :subjects
  has_many :subjects, through: :lessons
  has_many :lessons

  scope :teacher_divisions, ->(teacher_id) { joins(:teachers).where(users: {id: teacher_id}) }
end
