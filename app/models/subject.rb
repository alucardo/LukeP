class Subject < ActiveRecord::Base
  has_many :grades
  has_many :klasses
  belongs_to :teacher, class_name: "User"
end
