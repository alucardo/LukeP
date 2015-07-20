class User < ActiveRecord::Base
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_one  :student_division, foreign_key: 'student_id', class_name: 'Division'
  has_many :teacher_subject,   foreign_key: 'teacher_id', class_name: 'Subject'
  has_many :student_grades,    foreign_key: 'student_id', class_name: 'Grade'

  scope :students, -> { with_role :student}
  scope :unassigned, -> { where(division_id: nil).with_role :student }
  scope :unnasigneds_and_class_students, ->(division_id) {
        where("division_id = #{division_id} or division_id IS NULL").with_role :student }

  validates :firstname, presence: true
  validates :lastname, presence: true
  validates :roles, presence: true

  def get_roles_as_array
     roles(select: :name).collect(&:name)
  end

  def get_roles_as_string
    get_roles_as_array.join(', ')
  end

  def fullname
    firstname + " " + lastname
  end
end
