class Profile < ActiveRecord::Base
  attr_accessible :business_name, :image, :image2, :image3, :street, :city, :zip, :state, :country, :phone, :latitude, :longitude, :address

  belongs_to :user
  mount_uploader :image, ImageUploader
  mount_uploader :image2, ImageUploader
  mount_uploader :image3, ImageUploader

	geocoded_by :address
	after_validation :geocode

	def address
  	"#{self.street}, #{self.city}, #{self.state}, #{self.zip}"
	end
end
