FactoryGirl.define do
  sequence(:subject_name) { |n| "name_#{n}" }

  factory :subject do
    name { generate :subject_name }

    trait :with_teacher do
      after :build do |sub|
        sub.teacher = FactoryGirl.build :user, :teacher
      end
    end
  end
end
