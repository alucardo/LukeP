class Lesson < ActiveRecord::Base
  belongs_to :division
  belongs_to :student
  belongs_to :subject
end
