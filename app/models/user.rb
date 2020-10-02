class User < ApplicationRecord
    has_secure_password

    validates_presence_of :email
    validates_uniqueness_of :email

    validates :firstName, presence: true
    validates :lastName, presence: true

end
