class User < ApplicationRecord
  has_secure_password

  has_many :projects, dependent: :destroy

  validates_presence_of :email
  validates_uniqueness_of :email

  validates :firstName, presence: true
  validates :lastName, presence: true

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }
  # validates :password, presence: true, length: { minimum: 6 }
end
