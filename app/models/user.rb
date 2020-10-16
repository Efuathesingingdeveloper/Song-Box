class User < ApplicationRecord
    has_secure_password
    has_many :songs 
    validates_presence_of :email, :password
    validates :email, uniqueness: true
end
