# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

u = User.new(firstname: "Albus", lastname: "Dumbledore",
             email: 'albus.dumbledore@hogwart.co.uk', password: "password",
             password_confirmation: "password")
u.add_role :headmaster
u.save

5.times do |user|
  firstname = Faker::Name.first_name
  lastname = Faker::Name.last_name
  user = User.new(firstname: firstname, lastname: lastname,
                     email: "#{firstname}.#{lastname}@teacher.com", password: "password",
                     password_confirmation: "password")
  user.add_role :teacher
  user.save
end

10.times do |user|
  firstname = Faker::Name.first_name
  lastname = Faker::Name.last_name
  user = User.new(firstname: firstname, lastname: lastname,
                     email: "#{firstname}.#{lastname}@student.com", password: "password",
                     password_confirmation: "password")
  user.add_role :student
  user.save
end

5.times  do |i|
 s = Subject.new(name: Faker::Commerce.department)
 s.teacher = User.find(i+2)
 s.save
end

5.times  do |d|
 d = Division.new(name: Faker::Lorem.word)
 d.subjects = Subject.all
 d.save
end
