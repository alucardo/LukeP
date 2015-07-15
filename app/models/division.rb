class Division < ActiveRecord::Base
  has_many :students, class_name: "User"
  has_many :teachers, class_name: "User", through: :subjects
  has_many :subjects
end
