require 'rails_helper'

RSpec.describe Division, type: :model do
  it{ expect(subject).to have_many(:students) }
  it{ expect(subject).to have_many(:teachers).through(:subjects) }
  it{ expect(subject).to have_many(:subjects).through(:lessons) }
  it{ expect(subject).to have_many(:lessons)}
end
