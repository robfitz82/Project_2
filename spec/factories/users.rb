FactoryGirl.define do
	factory :user do
		firstname "Mary"
		lastname "Joe"
		username "Mjoe"
		password "MyString"
		password_digest BCrypt::Password.create('MyString')
		email "mjoe@gmail.com"
	end

end
