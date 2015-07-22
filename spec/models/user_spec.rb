require 'rails_helper'

RSpec.describe User, type: :model do
    it{ expect(subject).to have_one(:student_division) }
    it{ expect(subject).to have_many(:teacher_subject) }
    it{ expect(subject).to have_many(:student_grades) }
    it{ expect(subject).to have_many(:grades) }
end
