class User < ApplicationRecord
    has_secure_password
    has_one_attached :avatar

    #validates :email, presence: true
    validates_presence_of :email
    validates_uniqueness_of :email
end
