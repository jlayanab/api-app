class User < ApplicationRecord
    has_secure_password
    has_one_attached :avatar
    has_many :levels
    has_many :passes
    has_one_attached :image

    #validates :email, presence: true
    validates_presence_of :email
    validates_uniqueness_of :email

end
