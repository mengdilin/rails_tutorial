class User < ActiveRecord::Base
    before_save {self.email = self.email.downcase}
    validates :name, presence: true, length: {maximum:50}
    #validates(:name,presence:true)
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, format:{ with: VALID_EMAIL_REGEX}, presence: true, length: {maximum:50}, 
        uniqueness:{case_sensitive:false}
    has_secure_password
    validates :password, length: {minimum:6}
end
