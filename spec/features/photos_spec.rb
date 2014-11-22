require 'rails_helper'

feature "Photos", :type => :feature do
  before(:each) do
    @user = create(:user)
    visit login_path
    fill_in "Username", :with => @user.username
    fill_in "Password", :with => @user.password
    click_button "Login"
  end

  scenario "able to upload a photo" do
  	#setup
  	visit new_user_photo_path(@user.id)
  	
  	#exercise
  	fill_in "photo_title", with: "Portrait of a Man"
  	fill_in "photo_url", with: "www.mycoolphoto.com/"
  	fill_in "photo_price", with: 10
  	
  	click_button "Add a photo!"

  	#verify
  	expect(page).to have_text("Portrait of a Man" && "www.mycoolphoto.com/" && 10)
  end

  scenario "able to update photo info" do
  	#setup
  	visit edit_user_photo_path(@user.id)
  	#exercise
  	fill_in "photo_title", with: "Portrait of a Woman"
  	fill_in "photo_url", with: "www.mycoolpic.com/"
  	fill_in "photo_price", with: 10
  	
  	click_button "Edit Photo"

  	#verify
  	expect(page).to have_text("Portrait of a Woman" && "www.mycoolpic.com/" && 10)
  end

  scenario "visiting the home/explore page" do
  	#setup
  	photos = []
  	5.times do
  		photos << create(:photo)
  	end
  	#exercise
  	visit all_photos_path
  	#verify
  	photos.each do |pic|
  		expect(page).to have_text(pic.url)
  	end
  end
end
