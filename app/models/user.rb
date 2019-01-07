class User < ApplicationRecord
    has_many :answers
    has_many :questions, through: :answers
    validates :name, :presence => true
    validates :email, :presence => true
    has_secure_password
end
