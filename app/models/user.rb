class User
  include Mongoid::Document
  include ActiveModel::SecurePassword
  field :name, type: String
  field :email, type: String
  field :password_digest, type: String
  field :is_admin, type: Boolean, :default => false

  validates :name, presence: true
  validates :email, presence: true
  validates_uniqueness_of :email

  has_many :boards, dependent: :destroy
  # dependent: :destroy destroys all boards associated
  # with each user if a user is destroyed.
  has_secure_password


end
