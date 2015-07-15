class Subject < ActiveRecord::Base
  has_many :grades
  has_many :divisions, through: :lesson
  belongs_to :teacher, class_name: 'User'
end
