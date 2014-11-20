class Photo < ActiveRecord::Base
	has_many :category_photos
	has_many :categories, through: :category_photos
	belongs_to :user

	validates :title,
		presence: true
	validates :url,
		presence: true
end
