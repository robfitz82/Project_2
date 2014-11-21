# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


User.create({firstname: "John", lastname: "Doe", email: "test1@example.com", username: "user1", password: "password"})
User.create({firstname: "Jane", lastname: "Doe", email: "test2@example.com", username: "user2", password: "password"})
User.create({firstname: "Joe", lastname: "Testa", email: "test3@example.com", username: "user3", password: "password"})
User.create({firstname: "David", lastname: "Gudeman", email: "test4@example.com", username: "user4", password: "password"})

Photo.create({title: "test1", width: 800 , height: 400, url: "http://lorempixel.com/800/400/city/", price: 250, user_id: 1})
Photo.create({title: "test2", width: 800 , height: 400, url: "http://lorempixel.com/800/400/city/", price: 250, user_id: 2})
Photo.create({title: "test3", width: 800 , height: 400, url: "http://lorempixel.com/800/400/city/", price: 250, user_id: 3})
Photo.create({title: "test4", width: 800 , height: 400, url: "http://lorempixel.com/800/400/city/", price: 250, user_id: 4})

Category.create({name: "Portrait"})
Category.create({name: "Black and White"})
Category.create({name: "Landscape"})
Category.create({name: "Abstract"})
#Alternative

# User.delete_all
# 100.times do
# 	fname = Faker::Name.first_name
# 	lname = Faker::Name.last_name
# 	User.create(
# 		firstname: fname,
# 		lastname: lname,
# 		username: "#{fname}.#{lname}",
# 		password: "password",
# 		password_confirmation: "password",
# 		email: "#{fname}.#{lname}@gmail.com"
# 	) 
# 	# create(:user)
# end