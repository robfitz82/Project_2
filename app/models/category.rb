class Category < ActiveRecord::Base
	has_many :category_photos
	has_many :photos, through: :category_photos
end
