require 'rails_helper'
require 'spec_helper'
require 'rspec/collection_matchers'

describe User do
    it{ expect(subject).to have_one(:student_division) }
    it{ expect(subject).to have_many(:teacher_subject) }
    it{ expect(subject).to have_many(:student_grades) }
    it{ expect(subject).to have_many(:grades) }

    subject(:student) { FactoryGirl.build(:user, :student) }

    it "has valid student factory" do
      expect(student).to be_valid
    end

    it { expect(student).to validate_presence_of(:firstname) }

    it { expect(student).to validate_presence_of(:lastname) }

    it { expect(student).to validate_presence_of(:email) }

    it { expect(student).to validate_presence_of(:password) }

    it { expect(student).to validate_confirmation_of(:password) }

    it { expect(student).to validate_presence_of(:roles) }

    it { expect(student).to validate_uniqueness_of :email}


    let(:first_name) {"Johny"}
    let(:last_name) {"Bravo"}
    let(:full_name) {"Johny Bravo"}

    it "returns a contact's full name as a string" do
      student.firstname = first_name
      student.lastname = last_name
      expect(student.fullname).to eq full_name
    end

    describe "Saved user" do
      before :each do
        student.save
        student.add_role :headmaster
      end

      it "returns roles as array" do
        expect(student.fullname).to eq "#{student.firstname} #{student.lastname}"
      end

      it "return roles as string" do
        expect(student.get_roles_as_string).to eq 'student, headmaster'
      end
    end
end
