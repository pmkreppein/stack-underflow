class User < ApplicationRecord
    has_secure_password
    has_many :answers, through: :questions
    has_many :questions
    validates :name, :presence => true
    validates :email, :presence => true
    validates :email, :uniqueness => true


    def self.find_by_email(email)
        User.where(:email => email).first
    end


end
