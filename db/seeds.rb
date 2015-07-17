# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

u = User.new(firstname: "Albus", lastname: "Dumbledore",
             email: 'albus.dumbledore@hogwart.co.uk', password: "12345678",
             password_confirmation: "12345678")
u.save
u.add_role :headmaster

u = User.new(firstname: "Harry", lastname: "Potter",
             email: 'harry.potter@hogwart.co.uk', password: "12345678",
             password_confirmation: "12345678")
u.save
u.add_role :student

u = User.new(firstname: "Ron", lastname: "Weasley",
             email: 'ron.weasley@hogwart.co.uk', password: "12345678",
             password_confirmation: "12345678")
 u.save
 u.add_role :student

u = User.new(firstname: "Hermiona", lastname: "Granger",
             email: 'hermiona.granger@hogwart.co.uk', password: "12345678",
             password_confirmation: "12345678")
 u.save
 u.add_role :student

 3.times  do |division|
   division = Division.new(name: Faker::Lorem.word)
   division.save
 end

 3.times  do |subject|
   subject = Subject.new(name: Faker::Commerce.department)
   subject.save
 end
