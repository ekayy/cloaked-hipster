class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :profile_attributes

  has_one :profile, :dependent => :destroy
  has_many :dishes, :dependent => :destroy
  accepts_nested_attributes_for :profile, allow_destroy: true

  before_create :build_profile
  before_save { |user| user.email = email.downcase }

  acts_as_taggable
  ActsAsTaggableOn.remove_unused_tags = true

  def self.text_search(query)
    if query.present?
      joins(:profile).where("business_name @@ :q", q: query) | joins(:profile).tagged_with(query)
    else
      scoped
    end
  end
end
