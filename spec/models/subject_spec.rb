require 'rails_helper'

RSpec.describe Subject, type: :model do
  it{ expect(subject).to have_many(:grades) }
  it{ expect(subject).to have_many(:divisions) }
  it{ expect(subject).to belong_to(:teacher)}
end
