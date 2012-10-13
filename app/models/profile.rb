class Profile < ActiveRecord::Base
  attr_accessible :business_name, :image, :image2, :image3, :street, :city, :zip, :state, :country, :phone, :latitude, :longitude, :address

  belongs_to :user
  mount_uploader :image, ImageUploader
  mount_uploader :image2, ImageUploader
  mount_uploader :image3, ImageUploader

	geocoded_by :address
	after_validation :geocode

  validates_presence_of :business_name, :street, :city, :zip

	def address
  	"#{self.street}, #{self.city}, #{self.state}, #{self.zip}"
	end

  def self.text_search(query)
    if query.present?
      where("business_name @@ :q", q: query) | tagged_with(query)
    else
      scoped
    end
  end

  acts_as_gmappable
  def gmaps4rails_address
    "#{self.street}, #{self.city}, #{self.state}, #{self.zip}"
  end

private
  # def reprocess_image
  #   User.all.each do |user|
  #     user.profile.image.recreate_versions!
  #   end
  # end
end
