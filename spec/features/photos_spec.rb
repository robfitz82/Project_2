require 'rails_helper'

feature "Photos", :type => :feature do
  scenario "able to upload a photo" do
  	#setup
  	visit new_photo_path
  	#exercise
  	fill_in "Title", with: "Portrait of a Man"
  	fill_in "Width", with: 300
  	fill_in "Height", with: 300
  	fill_in "Url", with: "www.mycoolphoto.com/"
  	fill_in "Price", with: 10
  	
  	click_button "Upload"

  	#verify
  	expect(page).to have_text("Portrait of a Man" && 300 && 300 && "www.mycoolphoto.com/" && 10)
  end

  scenario "able to update photo info" do
  	#setup
  	visit edit_photo_path
  	#exercise
  	fill_in "Title", with: "Portrait of a Woman"
  	fill_in "Width", with: 400
  	fill_in "Height", with: 400
  	fill_in "Url", with: "www.mycoolpic.com/"
  	fill_in "Price", with: 10
  	
  	click_button "Edit Photo"

  	#verify
  	expect(page).to have_text("Portrait of a Woman" && 400 && 400 && "www.mycoolpic.com/" && 10)
  end

  scenario "visiting the home/explore page" do
  	#setup
  	photos = []
  	5.times do
  		photos << create(:photo)
  	end
  	#exercise
  	visit home_path
  	#verify
  	photos.each do |pic|
  		expect(page).to have_text(pic.url)
  	end
  end
end
