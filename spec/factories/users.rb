#use ffaker

FactoryGirl.define do
	# fname = Faker::Name.first_name
	# lname = Faker::Name.last_name
	# factory :user do
	# 	firstname fname
	# 	lastname lname
	# 	username "#{fname}.#{lname}"
	# 	password "MyString"
	# 	password_digest BCrypt::Password.create('MyString')
	# 	email "#{fname}.#{lname}@gmail.com"
	# end

	factory :user do
		firstname "fname"
		lastname "lname"
		username "username"
		password "MyString"
		password_digest BCrypt::Password.create('MyString')
		email "email@gmail.com"
	end

end
