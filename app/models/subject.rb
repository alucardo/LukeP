class Subject < ActiveRecord::Base
  has_many :grades
  has_many :divisions, through: :lessons
  belongs_to :teacher, class_name: 'User'
  has_many :lessons

  validates :teacher_id, presence: true

  scope :teacher_subjects_in_division, ->(teacher_id, division_id) {
        joins(:teacher).joins(:divisions).where(users: {id: teacher_id}, divisions: {id: division_id}) }
end
