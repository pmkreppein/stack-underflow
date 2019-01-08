class User < ApplicationRecord
    has_secure_password
    has_many :answers
    has_many :questions, through: :answers
    validates :name, :presence => true
    validates :email, :presence => true
    validates :email, :uniqueness => true
   

    def self.find_by_email(email)
        User.where(:email => email)
    end

    

end
