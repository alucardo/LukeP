require 'rails_helper'

RSpec.describe Lesson, type: :model do
  it{ expect(subject).to belong_to(:division) }
  it{ expect(subject).to belong_to(:subject) }
end
