
FactoryGirl.define do
  sequence(:email) { |n| "email_#{n}@email.com" }

  factory :user do
    firstname Faker::Name.first_name 
    lastname Faker::Name.last_name
    email { generate :email }
    password "password"
    password_confirmation { "password" }

    trait :student do
      after :build do |user|
        user.add_role :student
      end
    end

    trait :teacher do
      after :build do |user|
        user.add_role :teacher
      end
    end

    trait :headmaster do
      after :build do |user|
        user.add_role :headmaster
      end
    end
  end
end
