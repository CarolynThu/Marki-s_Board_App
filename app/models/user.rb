class User
  include Mongoid::Document
  include ActiveModel::SecurePassword
  field :name, type: String
  field :email, type: String
  field :password_digest, type: String
  field :is_admin, type: Boolean, :default => false

VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(?:\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :name, presence: true
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }
  validates_uniqueness_of :email
  

  has_secure_password
  has_many :boards, dependent: :destroy
  # dependent: :destroy destroys all boards associated
  # with each user if a user is destroyed.
 


end
