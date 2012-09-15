class Profile < ActiveRecord::Base
  attr_accessible :title, :image

  belongs_to :user
  mount_uploader :image, ImageUploader

end
