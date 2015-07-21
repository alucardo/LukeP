class Subject < ActiveRecord::Base
  has_many :grades
  has_many :divisions, through: :lessons
  belongs_to :teacher, class_name: 'User'
  has_many :lessons

  validates :teacher_id, presence: true  
end
