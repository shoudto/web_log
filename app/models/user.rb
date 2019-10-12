class User < ActiveRecord::Base
    has_many :blogs
    has_secure_password # allows to do the encryption 

    validates :name, :email, presence: true
end