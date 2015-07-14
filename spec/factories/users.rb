FactoryGirl.define do

  factory :user do
    email "student@email.com"
    password "password"
    password_confirmation { "password" }
  end

  factory :klass do
    name "SampleClass"
  end
end
