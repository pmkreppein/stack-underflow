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

    def self.from_omniauth(access_token)
      data = access_token.info
      user = User.where(email: data['email']).first
        unless user
         user = User.create(name: data['name'], email: data['email'], password: SecureRandom.hex(8))
        end
       user
    end

end
