require 'bcrypt'
password = BCrypt::Password.create('my-awesome-password')
if BCrypt::Password.new(password) == 'my-awesome-password'
  puts 'It works!'
else
  puts 'Fail'
end
