class User < ActiveRecord::Base
    has_secure_password
    validates :password_confirmation, presence: true
    validate :password_and_password_confirmation
    
    def password_and_password_confirmation
        password_confirmation == password
    end
end
