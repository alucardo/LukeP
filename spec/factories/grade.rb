FactoryGirl.define do

  factory :grade do
    grade 2
    
    trait :with_teachers do
      after :build do |sub|
        sub.teacher = FactoryGirl.build :user, :teacher
      end
    end
  end
end
