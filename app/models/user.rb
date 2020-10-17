class User < ApplicationRecord
    has_secure_password
    validates_presence_of :email, :password
    validates :email, uniqueness: true
end
