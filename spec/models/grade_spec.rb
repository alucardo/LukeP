require 'rails_helper'

RSpec.describe Grade, type: :model do
  it{ expect(subject).to belong_to(:subject) }
  it{ expect(subject).to belong_to(:student) }
end
