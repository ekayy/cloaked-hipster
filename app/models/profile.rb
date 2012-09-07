class Profile < ActiveRecord::Base
  attr_accessible :title, :image, :user_id

  belongs_to :user
  # mount_uploader :image, ImageUploader

end
