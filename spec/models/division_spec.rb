require 'rails_helper'

RSpec.describe Division, type: :model do
  it{ expect(subject).to have_many(:students) }
  it{ expect(subject).to have_many(:teachers) }
  it{ expect(subject).to have_many(:subjects) }
end
