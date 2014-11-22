require 'rails_helper'

feature "Users", :type => :feature do
  scenario "are able to sign up" do
  	#setup
  	visit signup_path
  	#exercise
  	fill_in "user_firstname", with: "Mary"
  	fill_in "user_lastname", with: "Joe"
  	fill_in "user_username", with: "Mjoe"
  	fill_in "user_password", with: "MyString"
  	fill_in "user_email", with: "mjoe@gmail.com"
  	
  	click_button "Signup"

  	#verify
    #expect(session[:user_id]).to_not be_nil
  	expect(page).to have_text("You are now logged in!")
  end

  scenario "are able to update user info" do
  	#setup
    @user = create(:user)
    visit login_path
    fill_in "Username", :with => @user.username
    fill_in "Password", :with => @user.password
    click_button "Login"
  	visit edit_user_path(@user.id)
  	#exercise
  	fill_in "user_firstname", with: "Mari"
    fill_in "user_lastname", with: "Joe"
    fill_in "user_username", with: "Mjoe"
    fill_in "user_password", with: "MyString"
    fill_in "user_password_confirmation", with: "MyString"
    fill_in "user_email", with: "marijoe@gmail.com"
  	
  	click_button "Commit Changes"

  	#verify
  	expect(page).to have_text("Your profile is updated")
  end

  scenario "are able to log in and be directed home" do
  	#setup
    @user = create(:user)
  	visit login_path
  	#exercise
  	fill_in "username", with: @user.username
  	fill_in "password", with: @user.password

  	click_button "Login"

  	#verify
  	#expect(session[:user_id]).to_not be_nil
    expect(page).to have_text("You are now logged in.")
  end
end
