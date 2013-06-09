class User < ActiveRecord::Base
	  #has_many :tutorials
	  #has_many :memberships
	  #has_many :teams, :through => :memberships
	  #has_many :messages

	  #has_many :posts, :as => :postable, :dependent => :destroy
	  rolify
	  # Include default devise modules. Others available are:
	  # :token_authenticatable, :confirmable,
	  # :lockable, :timeoutable and :omniauthable
	  devise :invitable, :database_authenticatable, :registerable, #:confirmable,
	         :recoverable, :rememberable, :trackable, :validatable

	  # Setup accessible (or protected) attributes for your model
	  attr_accessible :role_ids, :as => :admin
	  attr_accessible :name, :email, :password, :password_confirmation, :remember_me


	  before_save { |user| user.email = email.downcase }

	  after_create :add_role_to_user

	  validates :name, :presence => true, uniqueness: { case_sensitive: false }
	  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	  validates :email, :presence => true, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }
  
end
