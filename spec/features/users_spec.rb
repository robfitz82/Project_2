require 'rails_helper'

feature "Users", :type => :feature do
  scenario "are able to sign up" do
  	#setup
  	visit new_user_path
  	#exercise
  	fill_in "Firstname", with: "Mary"
  	fill_in "Lastname", with: "Joe"
  	fill_in "Username", with: "Mjoe"
  	fill_in "Password", with: "MyString"
  	fill_in "Email", with: "mjoe@gmail.com"
  	
  	click_button "Sign Up"

  	#verify
  	expect(page).to have_text("Mary" && "Joe" && "Mjoe" && "mjoe@gmail.com")
  end

  scenario "are able to update user info" do
  	#setup
  	visit edit_user_path
  	#exercise
  	fill_in "Firstname", with: "Mari"
  	fill_in "Lastname", with: "Joe"
  	fill_in "Username", with: "Mjoe"
  	fill_in "Password", with: "MyString"
  	fill_in "Email", with: "marijoe@gmail.com"
  	
  	click_button "Edit Info"

  	#verify
  	expect(page).to have_text("Mari" && "Joe" && "Mjoe" && "marijoe@gmail.com")
  end

  scenario "are able to log in and be directed home" do
  	#setup
  	visit login_path
  	#exercise
  	fill_in "Username", with: "Mjoe"
  	fill_in "Password", with: "MyString"

  	click_button "Login"

  	#verify
  	expect(session[:user_id]).to_not be_nil
  end
end
