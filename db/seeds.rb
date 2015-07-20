# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

u = User.create(firstname: "Albus", lastname: "Dumbledore",
             email: 'albus.dumbledore@hogwart.co.uk', password: "password",
             password_confirmation: "password")
u.add_role :headmaster

10.times do |user|
  firstname = Faker::Name.first_name
  lastname = Faker::Name.last_name
  user = User.create(firstname: firstname, lastname: lastname,
                     email: "#{firstname}.#{lastname}@student.com", password: "password",
                     password_confirmation: "password")
  user.add_role :student
end

5.times do |user|
  firstname = Faker::Name.first_name
  lastname = Faker::Name.last_name
  user = User.create(firstname: firstname, lastname: lastname,
                     email: "#{firstname}.#{lastname}@teacher.com", password: "password",
                     password_confirmation: "password")
  user.add_role :teacher
end

3.times  do |division|
 division = Division.create(name: Faker::Lorem.word)
end

3.times  do |subject|
 subject = Subject.create(name: Faker::Commerce.department)
end
