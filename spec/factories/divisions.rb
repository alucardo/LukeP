FactoryGirl.define do
  sequence(:name) { |n| "name_#{n}" }

  factory :division do
    name { generate :name }

    trait :with_students do
      after :build do |div|
        div.students << 3.times.map { FactoryGirl.build :user, :student }
      end
    end

    trait :with_subjects do
      after :build do |div|
        div.subjects << 3.times.map { FactoryGirl.build :subject, :with_teachers}
      end
    end
  end
end
