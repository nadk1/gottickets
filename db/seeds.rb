# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Booking.destroy_all
Event.destroy_all
Category.destroy_all
User.destroy_all

user1 = User.create(email: "test@gmail.com", password: "123456")
category1 = Category.create(name: "Sport")
event1 = Event.new(name: "soccer match", description: "The one and only manchester vs liverpool match of the year", location: "England", price: 100, capacity: 100, date: "10/06/2022")

event1.user = user1
event1.category = category1

event1.save

